import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'sync_policy.dart';
import 'toilet.dart';

/// A latitude/longitude box.
class BBox {
  const BBox(this.south, this.west, this.north, this.east);

  factory BBox.around(double lat, double lon, {double delta = 0.02}) =>
      BBox(lat - delta, lon - delta, lat + delta, lon + delta);

  final double south, west, north, east;
}

/// Loads toilets for an area, caching the last result on the device.
///
/// Development reads straight from the Overpass API. In production this
/// points at our own backend, which merges OSM with city open data on the
/// cadence in [SyncPolicy].
class ToiletRepository {
  ToiletRepository({
    http.Client? client,
    this.endpoints = const ['https://overpass-api.de/api/interpreter'],
    this.retryDelay = const Duration(seconds: 3),
    DateTime Function()? clock,
  }) : _client = client ?? http.Client(),
       _clock = clock ?? DateTime.now;

  /// Overpass asks clients to identify themselves; generic library agents
  /// may be throttled or refused.
  static const userAgent =
      'PetitCoin/0.1 (+https://github.com/YingQiu0871/Petit-Coin)';

  static const _kCache = 'toiletCache';
  static const _kSyncedAt = 'toiletSyncedAt';

  final http.Client _client;

  /// Tried in order until one answers. Public mirrors were unreachable
  /// from CI in October 2026, so only the main instance is listed.
  final List<String> endpoints;

  /// Wait before retrying an endpoint that said it is busy.
  final Duration retryDelay;
  final DateTime Function() _clock;

  Future<DateTime?> lastSync() async {
    final ms = (await SharedPreferences.getInstance()).getInt(_kSyncedAt);
    return ms == null ? null : DateTime.fromMillisecondsSinceEpoch(ms);
  }

  Future<List<Toilet>> cached() async {
    final raw = (await SharedPreferences.getInstance()).getString(_kCache);
    if (raw == null) return const [];
    return (jsonDecode(raw) as List)
        .map((e) => Toilet.fromJson((e as Map).cast<String, dynamic>()))
        .toList();
  }

  /// Returns cached toilets, refreshing first when stale or [force]d.
  Future<List<Toilet>> load(BBox box, {bool force = false}) async {
    if (!force && !SyncPolicy.isStale(await lastSync(), _clock())) {
      final hit = await cached();
      if (hit.isNotEmpty) return hit;
    }
    final fresh = await fetch(box);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _kCache,
      jsonEncode(fresh.map((t) => t.toJson()).toList()),
    );
    await prefs.setInt(_kSyncedAt, _clock().millisecondsSinceEpoch);
    return fresh;
  }

  Future<List<Toilet>> fetch(BBox b) async {
    final query =
        '[out:json][timeout:25];'
        'nwr["amenity"="toilets"](${b.south},${b.west},${b.north},${b.east});'
        'out center tags;';
    Object? lastError;
    for (final endpoint in endpoints) {
      // A busy instance (429/5xx) gets one more try before moving on.
      for (var attempt = 0; attempt < 2; attempt++) {
        if (attempt > 0) await Future<void>.delayed(retryDelay);
        try {
          final res = await _client
              .post(
                Uri.parse(endpoint),
                headers: {'User-Agent': userAgent},
                body: {'data': query},
              )
              .timeout(const Duration(seconds: 30));
          if (res.statusCode == 200) return parseOverpass(res.body);
          lastError = http.ClientException(
            'Overpass ${res.statusCode}',
            res.request?.url,
          );
          if (res.statusCode != 429 && res.statusCode < 500) break;
        } catch (e) {
          lastError = e;
          break;
        }
      }
    }
    throw lastError ?? StateError('no Overpass endpoints configured');
  }

  static List<Toilet> parseOverpass(String body) {
    final elements = (jsonDecode(body) as Map)['elements'] as List? ?? const [];
    return elements
        .map((e) => Toilet.fromOverpass((e as Map).cast<String, dynamic>()))
        .whereType<Toilet>()
        .toList();
  }
}

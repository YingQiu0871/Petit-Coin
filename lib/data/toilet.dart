import 'dart:math' as math;

enum Wheelchair { yes, limited, no, unknown }

/// A public toilet, normalised from OpenStreetMap or a city open-data feed.
class Toilet {
  const Toilet({
    required this.id,
    required this.lat,
    required this.lon,
    required this.source,
    this.name,
    this.fee,
    this.wheelchair = Wheelchair.unknown,
    this.changingTable,
    this.openingHours,
  });

  /// Stable id such as `osm:node/123`.
  final String id;
  final double lat;
  final double lon;
  final String source;
  final String? name;

  /// True when a fee is charged, null when unknown.
  final bool? fee;
  final Wheelchair wheelchair;
  final bool? changingTable;

  /// Raw OSM `opening_hours` value.
  final String? openingHours;

  bool get isFree => fee == false;
  bool get isAccessible => wheelchair == Wheelchair.yes;
  bool get hasChangingTable => changingTable == true;

  /// Parses an OSM element from an Overpass `out center tags` response.
  static Toilet? fromOverpass(Map<String, dynamic> e) {
    final tags = (e['tags'] as Map?)?.cast<String, dynamic>() ?? const {};
    final center = (e['center'] as Map?)?.cast<String, dynamic>();
    final lat = (e['lat'] ?? center?['lat']) as num?;
    final lon = (e['lon'] ?? center?['lon']) as num?;
    if (lat == null || lon == null) return null;
    if (tags['access'] == 'private' || tags['access'] == 'no') return null;
    return Toilet(
      id: 'osm:${e['type']}/${e['id']}',
      lat: lat.toDouble(),
      lon: lon.toDouble(),
      source: 'OpenStreetMap',
      name: tags['name'] as String?,
      fee: _yesNo(tags['fee']),
      wheelchair: switch (tags['wheelchair']) {
        'yes' || 'designated' => Wheelchair.yes,
        'limited' => Wheelchair.limited,
        'no' => Wheelchair.no,
        _ => Wheelchair.unknown,
      },
      changingTable: _yesNo(tags['changing_table']),
      openingHours: tags['opening_hours'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'lat': lat,
    'lon': lon,
    'source': source,
    'name': name,
    'fee': fee,
    'wheelchair': wheelchair.name,
    'changingTable': changingTable,
    'openingHours': openingHours,
  };

  factory Toilet.fromJson(Map<String, dynamic> j) => Toilet(
    id: j['id'] as String,
    lat: (j['lat'] as num).toDouble(),
    lon: (j['lon'] as num).toDouble(),
    source: j['source'] as String,
    name: j['name'] as String?,
    fee: j['fee'] as bool?,
    wheelchair:
        Wheelchair.values.asNameMap()[j['wheelchair']] ?? Wheelchair.unknown,
    changingTable: j['changingTable'] as bool?,
    openingHours: j['openingHours'] as String?,
  );

  /// Great-circle distance in metres.
  double distanceTo(double lat2, double lon2) {
    const r = 6371000.0;
    final p1 = lat * math.pi / 180, p2 = lat2 * math.pi / 180;
    final dp = (lat2 - lat) * math.pi / 180, dl = (lon2 - lon) * math.pi / 180;
    final a =
        math.pow(math.sin(dp / 2), 2) +
        math.cos(p1) * math.cos(p2) * math.pow(math.sin(dl / 2), 2);
    return 2 * r * math.asin(math.sqrt(a));
  }
}

bool? _yesNo(Object? v) => switch (v) {
  'yes' => true,
  'no' => false,
  _ => null,
};

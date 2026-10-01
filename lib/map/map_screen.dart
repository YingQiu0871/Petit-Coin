import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/filters.dart';
import '../data/toilet.dart';
import '../data/toilet_repository.dart';
import '../l10n/app_localizations.dart';
import '../settings/settings_screen.dart';
import '../widgets/glass.dart';
import 'toilet_panel.dart';

/// Free vector tiles built from OpenStreetMap, no API key needed.
const _styleUrl = 'https://tiles.openfreemap.org/styles/liberty';

/// Châtelet, Paris: used until the user's position is known.
const _fallback = LatLng(48.8584, 2.3470);

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required this.repository, this.onStyleLoaded});

  final ToiletRepository repository;

  /// Called once the map style has loaded; lets device tests wait for it.
  final VoidCallback? onStyleLoaded;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapLibreMapController? _map;
  LatLng _here = _fallback;
  bool _hasLocation = false;
  List<Toilet> _all = const [];
  ToiletFilters _filters = const ToiletFilters();
  Toilet? _selected;
  bool _loading = true;
  bool _failed = false;

  List<Toilet> get _shown => nearestMatching(
    _all,
    lat: _here.latitude,
    lon: _here.longitude,
    filters: _filters,
    now: DateTime.now(),
  );

  @override
  void initState() {
    super.initState();
    _start();
  }

  Future<void> _start() async {
    _all = await widget.repository.cached();
    if (mounted) setState(() {});
    await _locate(move: false);
    await _load();
  }

  Future<void> _locate({bool move = true}) async {
    try {
      var perm = await Geolocator.checkPermission();
      if (perm == LocationPermission.denied) {
        perm = await Geolocator.requestPermission();
      }
      if (perm == LocationPermission.denied ||
          perm == LocationPermission.deniedForever) {
        return;
      }
      final pos = await Geolocator.getCurrentPosition();
      if (!mounted) return;
      setState(() {
        _here = LatLng(pos.latitude, pos.longitude);
        _hasLocation = true;
      });
      if (move) {
        await _map?.animateCamera(CameraUpdate.newLatLngZoom(_here, 15));
      }
    } catch (e) {
      debugPrint('Location unavailable: $e');
    }
  }

  Future<void> _load({bool force = false}) async {
    setState(() {
      _loading = true;
      _failed = false;
    });
    try {
      final box = BBox.around(_here.latitude, _here.longitude);
      _all = await widget.repository.load(box, force: force);
    } catch (e) {
      debugPrint('Toilet load failed: $e');
      _failed = _all.isEmpty;
    }
    if (!mounted) return;
    setState(() => _loading = false);
    await _drawPins();
  }

  String _hex(Color c) =>
      '#${(c.toARGB32() & 0xFFFFFF).toRadixString(16).padLeft(6, '0')}';

  Future<void> _drawPins() async {
    final map = _map;
    if (map == null) return;
    final scheme = Theme.of(context).colorScheme;
    final shown = _shown;
    await map.clearCircles();
    await map.addCircles(
      [
        for (final t in shown)
          CircleOptions(
            geometry: LatLng(t.lat, t.lon),
            circleRadius: t.id == _selected?.id ? 11 : 8,
            circleColor: _hex(
              t.id == _selected?.id ? scheme.tertiary : scheme.primary,
            ),
            circleStrokeColor: '#ffffff',
            circleStrokeWidth: 2.5,
          ),
      ],
      [
        for (final t in shown) {'id': t.id},
      ],
    );
  }

  void _onCircleTapped(Circle c) {
    final id = c.data?['id'];
    final t = _all.where((t) => t.id == id).firstOrNull;
    if (t == null) return;
    setState(() => _selected = t);
    _drawPins();
  }

  void _select(Toilet? t) {
    setState(() => _selected = t);
    _drawPins();
    if (t != null) {
      _map?.animateCamera(CameraUpdate.newLatLng(LatLng(t.lat, t.lon)));
    }
  }

  void _setFilters(ToiletFilters f) {
    setState(() {
      _filters = f;
      _selected = null;
    });
    _drawPins();
  }

  Future<void> _directions(Toilet t) async {
    final uri = switch (defaultTargetPlatform) {
      TargetPlatform.iOS => Uri.parse(
        'https://maps.apple.com/?daddr=${t.lat},${t.lon}&dirflg=w',
      ),
      _ => Uri.parse(
        'https://www.google.com/maps/dir/?api=1'
        '&destination=${t.lat},${t.lon}&travelmode=walking',
      ),
    };
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  void dispose() {
    _map?.onCircleTapped.remove(_onCircleTapped);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: MapLibreMap(
              styleString: _styleUrl,
              initialCameraPosition: const CameraPosition(
                target: _fallback,
                zoom: 15,
              ),
              myLocationEnabled: _hasLocation,
              compassEnabled: false,
              attributionButtonPosition: AttributionButtonPosition.bottomLeft,
              onMapCreated: (c) {
                _map = c;
                c.onCircleTapped.add(_onCircleTapped);
              },
              onStyleLoadedCallback: () {
                if (_hasLocation) {
                  _map?.moveCamera(CameraUpdate.newLatLngZoom(_here, 15));
                }
                _drawPins();
                widget.onStyleLoaded?.call();
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Column(
                children: [
                  GlassSurface(
                    padding: const EdgeInsets.only(left: 16, right: 4),
                    child: SizedBox(
                      height: 56,
                      child: Row(
                        children: [
                          Icon(Icons.search, color: scheme.onSurfaceVariant),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: l10n.searchHint,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            tooltip: l10n.settings,
                            icon: const Icon(Icons.settings_outlined),
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (_) => SettingsScreen(
                                  repository: widget.repository,
                                  onSyncNow: () => _load(force: true),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _FilterRow(filters: _filters, onChanged: _setFilters),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: GlassSurface(
                    borderRadius: BorderRadius.circular(18),
                    child: IconButton(
                      tooltip: l10n.locateMe,
                      iconSize: 26,
                      padding: const EdgeInsets.all(14),
                      color: scheme.primary,
                      icon: const Icon(Icons.my_location),
                      onPressed: () async {
                        await _locate();
                        await _load();
                      },
                    ),
                  ),
                ),
                GlassSurface(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(28),
                  ),
                  padding: EdgeInsets.fromLTRB(
                    20,
                    10,
                    20,
                    20 + MediaQuery.paddingOf(context).bottom,
                  ),
                  child: ToiletPanel(
                    toilets: _shown,
                    selected: _selected,
                    here: _here,
                    loading: _loading,
                    failed: _failed,
                    onSelect: _select,
                    onRetry: () => _load(force: true),
                    onDirections: _directions,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterRow extends StatelessWidget {
  const _FilterRow({required this.filters, required this.onChanged});

  final ToiletFilters filters;
  final ValueChanged<ToiletFilters> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final items = [
      (
        l10n.filterOpenNow,
        filters.openNow,
        (bool v) => filters.copyWith(openNow: v),
      ),
      (l10n.filterFree, filters.free, (bool v) => filters.copyWith(free: v)),
      (
        l10n.filterAccessible,
        filters.accessible,
        (bool v) => filters.copyWith(accessible: v),
      ),
      (
        l10n.filterBabyChange,
        filters.changingTable,
        (bool v) => filters.copyWith(changingTable: v),
      ),
    ];
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final (label, on, next) = items[i];
          return GlassSurface(
            borderRadius: BorderRadius.circular(10),
            child: FilterChip(
              label: Text(label),
              selected: on,
              onSelected: (v) => onChanged(next(v)),
              backgroundColor: Colors.transparent,
              side: BorderSide.none,
            ),
          );
        },
      ),
    );
  }
}

import 'opening_hours.dart';
import 'toilet.dart';

class ToiletFilters {
  const ToiletFilters({
    this.openNow = false,
    this.free = false,
    this.accessible = false,
    this.changingTable = false,
  });

  final bool openNow;
  final bool free;
  final bool accessible;
  final bool changingTable;

  ToiletFilters copyWith({
    bool? openNow,
    bool? free,
    bool? accessible,
    bool? changingTable,
  }) => ToiletFilters(
    openNow: openNow ?? this.openNow,
    free: free ?? this.free,
    accessible: accessible ?? this.accessible,
    changingTable: changingTable ?? this.changingTable,
  );

  /// "Open now" hides only toilets known to be closed: most OSM entries
  /// have no hours, and hiding them all would empty the map.
  bool matches(Toilet t, DateTime now) =>
      (!openNow || openStateAt(t.openingHours, now) != OpenState.closed) &&
      (!free || t.isFree) &&
      (!accessible || t.isAccessible) &&
      (!changingTable || t.hasChangingTable);
}

/// Toilets that pass [filters], nearest first.
List<Toilet> nearestMatching(
  Iterable<Toilet> toilets, {
  required double lat,
  required double lon,
  required ToiletFilters filters,
  required DateTime now,
}) {
  final list = toilets.where((t) => filters.matches(t, now)).toList()
    ..sort((a, b) => a.distanceTo(lat, lon).compareTo(b.distanceTo(lat, lon)));
  return list;
}

/// How often each source is pulled. The backend pipeline uses the same
/// cadence; the app only refreshes the visible area when it is stale.
class SyncPolicy {
  const SyncPolicy._();

  /// OpenStreetMap: Geofabrik publishes France extracts daily.
  static const osm = Duration(days: 1);

  /// Paris open data carries in-service status, so it is pulled daily.
  static const parisOpenData = Duration(days: 1);

  /// Other city datasets (Lyon, Toulouse, Marseille) change rarely.
  static const otherCities = Duration(days: 7);

  /// The app refreshes the user's area on launch past this age.
  static const staleAfter = Duration(hours: 24);

  static bool isStale(DateTime? lastSync, DateTime now) =>
      lastSync == null || now.difference(lastSync) >= staleAfter;
}

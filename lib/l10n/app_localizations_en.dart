// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Petit Coin';

  @override
  String get searchHint => 'Search places or toilets';

  @override
  String get settings => 'Settings';

  @override
  String get nearby => 'Toilets nearby';

  @override
  String get filterOpenNow => 'Open now';

  @override
  String get filterFree => 'Free';

  @override
  String get filterAccessible => 'Accessible';

  @override
  String get filterBabyChange => 'Baby change';

  @override
  String get paid => 'Paid';

  @override
  String get openNow => 'Open';

  @override
  String get closedNow => 'Closed';

  @override
  String get hoursUnknown => 'Hours unknown';

  @override
  String get hours => 'Hours';

  @override
  String get directions => 'Directions';

  @override
  String get report => 'Report';

  @override
  String get locateMe => 'My location';

  @override
  String get noResults => 'No toilets match these filters. Try removing one.';

  @override
  String get loadError => 'Could not load toilets. Check your connection.';

  @override
  String get retry => 'Retry';

  @override
  String get appearance => 'Appearance';

  @override
  String get dynamicColor => 'Dynamic color';

  @override
  String get dynamicColorSub => 'Colors generated from your wallpaper';

  @override
  String get dynamicColorUnavailable => 'Not supported on this device';

  @override
  String get presetPalettes => 'Preset palettes';

  @override
  String get language => 'Language';

  @override
  String get followSystem => 'Follow system';

  @override
  String get dataAndUpdates => 'Data and updates';

  @override
  String get lastSync => 'Last sync';

  @override
  String get neverSynced => 'Not synced yet';

  @override
  String get syncNow => 'Sync now';

  @override
  String get syncNote =>
      'When you open the app and the last sync is over 24 hours old, your area refreshes in the background.';

  @override
  String get privacy => 'Privacy';

  @override
  String get analytics => 'Anonymous usage stats';

  @override
  String get analyticsSub => 'Helps us improve the app, no location';

  @override
  String get optionalOffByDefault => 'Optional, off by default';

  @override
  String get readPolicy => 'Read the full privacy policy';

  @override
  String get withdrawConsent => 'Withdraw consent';

  @override
  String get consentTitle => 'Please read our privacy policy';

  @override
  String get consentLead => 'We only collect what is needed to find a toilet.';

  @override
  String get consentPointLocation =>
      'Your location stays on your phone to find nearby toilets. It is never stored on our servers.';

  @override
  String get consentPointNoSale => 'We never sell data and use no ad tracking.';

  @override
  String get consentPointContrib =>
      'Your fixes and ratings are shown anonymously to help others.';

  @override
  String get consentPointWithdraw =>
      'You can withdraw consent or delete your data in Settings at any time.';

  @override
  String get agreeAndContinue => 'Agree and continue';

  @override
  String get decline => 'Decline';

  @override
  String get declinedTitle => 'Your consent is needed';

  @override
  String get declinedBody =>
      'The app cannot be used without accepting the privacy policy. You can review it again at any time.';

  @override
  String get reviewAgain => 'Review the privacy policy';

  @override
  String get osmAttribution => '© OpenStreetMap contributors';

  @override
  String get back => 'Back';

  @override
  String get close => 'Close';

  @override
  String get paletteLagoon => 'Lagoon';

  @override
  String get paletteIndigo => 'Indigo';

  @override
  String get paletteForest => 'Forest';

  @override
  String get paletteRose => 'Rose';

  @override
  String get paletteAmber => 'Amber';

  @override
  String get paletteLavender => 'Lavender';

  @override
  String get paletteBrick => 'Brick';

  @override
  String get paletteGraphite => 'Graphite';

  @override
  String get unnamedToilet => 'Public toilet';

  @override
  String resultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count results',
      one: '1 result',
      zero: 'No results',
    );
    return '$_temp0';
  }

  @override
  String walkMinutes(int minutes) {
    return '$minutes min walk';
  }

  @override
  String sourceLine(String source) {
    return 'Source: $source';
  }
}

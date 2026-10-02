import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Petit Coin'**
  String get appTitle;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search places or toilets'**
  String get searchHint;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @nearby.
  ///
  /// In en, this message translates to:
  /// **'Toilets nearby'**
  String get nearby;

  /// No description provided for @filterOpenNow.
  ///
  /// In en, this message translates to:
  /// **'Open now'**
  String get filterOpenNow;

  /// No description provided for @filterFree.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get filterFree;

  /// No description provided for @filterAccessible.
  ///
  /// In en, this message translates to:
  /// **'Accessible'**
  String get filterAccessible;

  /// No description provided for @filterBabyChange.
  ///
  /// In en, this message translates to:
  /// **'Baby change'**
  String get filterBabyChange;

  /// No description provided for @paid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get paid;

  /// No description provided for @openNow.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get openNow;

  /// No description provided for @closedNow.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get closedNow;

  /// No description provided for @hoursUnknown.
  ///
  /// In en, this message translates to:
  /// **'Hours unknown'**
  String get hoursUnknown;

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get hours;

  /// No description provided for @directions.
  ///
  /// In en, this message translates to:
  /// **'Directions'**
  String get directions;

  /// No description provided for @report.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get report;

  /// No description provided for @locateMe.
  ///
  /// In en, this message translates to:
  /// **'My location'**
  String get locateMe;

  /// No description provided for @noResults.
  ///
  /// In en, this message translates to:
  /// **'No toilets match these filters. Try removing one.'**
  String get noResults;

  /// No description provided for @loadError.
  ///
  /// In en, this message translates to:
  /// **'Could not load toilets. Check your connection.'**
  String get loadError;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @dynamicColor.
  ///
  /// In en, this message translates to:
  /// **'Dynamic color'**
  String get dynamicColor;

  /// No description provided for @dynamicColorSub.
  ///
  /// In en, this message translates to:
  /// **'Colors generated from your wallpaper'**
  String get dynamicColorSub;

  /// No description provided for @dynamicColorUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Not supported on this device'**
  String get dynamicColorUnavailable;

  /// No description provided for @presetPalettes.
  ///
  /// In en, this message translates to:
  /// **'Preset palettes'**
  String get presetPalettes;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @followSystem.
  ///
  /// In en, this message translates to:
  /// **'Follow system'**
  String get followSystem;

  /// No description provided for @dataAndUpdates.
  ///
  /// In en, this message translates to:
  /// **'Data and updates'**
  String get dataAndUpdates;

  /// No description provided for @lastSync.
  ///
  /// In en, this message translates to:
  /// **'Last sync'**
  String get lastSync;

  /// No description provided for @neverSynced.
  ///
  /// In en, this message translates to:
  /// **'Not synced yet'**
  String get neverSynced;

  /// No description provided for @syncNow.
  ///
  /// In en, this message translates to:
  /// **'Sync now'**
  String get syncNow;

  /// No description provided for @syncNote.
  ///
  /// In en, this message translates to:
  /// **'When you open the app and the last sync is over 24 hours old, your area refreshes in the background.'**
  String get syncNote;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacy;

  /// No description provided for @analytics.
  ///
  /// In en, this message translates to:
  /// **'Anonymous usage stats'**
  String get analytics;

  /// No description provided for @analyticsSub.
  ///
  /// In en, this message translates to:
  /// **'Helps us improve the app, no location'**
  String get analyticsSub;

  /// No description provided for @optionalOffByDefault.
  ///
  /// In en, this message translates to:
  /// **'Optional, off by default'**
  String get optionalOffByDefault;

  /// No description provided for @readPolicy.
  ///
  /// In en, this message translates to:
  /// **'Read the full privacy policy'**
  String get readPolicy;

  /// No description provided for @withdrawConsent.
  ///
  /// In en, this message translates to:
  /// **'Withdraw consent'**
  String get withdrawConsent;

  /// No description provided for @consentTitle.
  ///
  /// In en, this message translates to:
  /// **'Please read our privacy policy'**
  String get consentTitle;

  /// No description provided for @consentLead.
  ///
  /// In en, this message translates to:
  /// **'We only collect what is needed to find a toilet.'**
  String get consentLead;

  /// No description provided for @consentPointLocation.
  ///
  /// In en, this message translates to:
  /// **'Your location stays on your phone to find nearby toilets. It is never stored on our servers.'**
  String get consentPointLocation;

  /// No description provided for @consentPointNoSale.
  ///
  /// In en, this message translates to:
  /// **'We never sell data and use no ad tracking.'**
  String get consentPointNoSale;

  /// No description provided for @consentPointContrib.
  ///
  /// In en, this message translates to:
  /// **'Your fixes and ratings are shown anonymously to help others.'**
  String get consentPointContrib;

  /// No description provided for @consentPointWithdraw.
  ///
  /// In en, this message translates to:
  /// **'You can withdraw consent or delete your data in Settings at any time.'**
  String get consentPointWithdraw;

  /// No description provided for @agreeAndContinue.
  ///
  /// In en, this message translates to:
  /// **'Agree and continue'**
  String get agreeAndContinue;

  /// No description provided for @decline.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get decline;

  /// No description provided for @declinedTitle.
  ///
  /// In en, this message translates to:
  /// **'Your consent is needed'**
  String get declinedTitle;

  /// No description provided for @declinedBody.
  ///
  /// In en, this message translates to:
  /// **'The app cannot be used without accepting the privacy policy. You can review it again at any time.'**
  String get declinedBody;

  /// No description provided for @reviewAgain.
  ///
  /// In en, this message translates to:
  /// **'Review the privacy policy'**
  String get reviewAgain;

  /// No description provided for @osmAttribution.
  ///
  /// In en, this message translates to:
  /// **'© OpenStreetMap contributors'**
  String get osmAttribution;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @paletteLagoon.
  ///
  /// In en, this message translates to:
  /// **'Lagoon'**
  String get paletteLagoon;

  /// No description provided for @paletteIndigo.
  ///
  /// In en, this message translates to:
  /// **'Indigo'**
  String get paletteIndigo;

  /// No description provided for @paletteForest.
  ///
  /// In en, this message translates to:
  /// **'Forest'**
  String get paletteForest;

  /// No description provided for @paletteRose.
  ///
  /// In en, this message translates to:
  /// **'Rose'**
  String get paletteRose;

  /// No description provided for @paletteAmber.
  ///
  /// In en, this message translates to:
  /// **'Amber'**
  String get paletteAmber;

  /// No description provided for @paletteLavender.
  ///
  /// In en, this message translates to:
  /// **'Lavender'**
  String get paletteLavender;

  /// No description provided for @paletteBrick.
  ///
  /// In en, this message translates to:
  /// **'Brick'**
  String get paletteBrick;

  /// No description provided for @paletteGraphite.
  ///
  /// In en, this message translates to:
  /// **'Graphite'**
  String get paletteGraphite;

  /// No description provided for @unnamedToilet.
  ///
  /// In en, this message translates to:
  /// **'Public toilet'**
  String get unnamedToilet;

  /// No description provided for @resultCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No results} =1{1 result} other{{count} results}}'**
  String resultCount(int count);

  /// No description provided for @walkMinutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min walk'**
  String walkMinutes(int minutes);

  /// No description provided for @sourceLine.
  ///
  /// In en, this message translates to:
  /// **'Source: {source}'**
  String sourceLine(String source);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'de',
    'en',
    'es',
    'fr',
    'it',
    'ja',
    'ko',
    'nl',
    'pl',
    'pt',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hant':
            return AppLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

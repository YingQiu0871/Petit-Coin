// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Petit Coin';

  @override
  String get searchHint => 'Orte oder Toiletten suchen';

  @override
  String get settings => 'Einstellungen';

  @override
  String get nearby => 'Toiletten in der Nähe';

  @override
  String get filterOpenNow => 'Jetzt geöffnet';

  @override
  String get filterFree => 'Kostenlos';

  @override
  String get filterAccessible => 'Barrierefrei';

  @override
  String get filterBabyChange => 'Wickeltisch';

  @override
  String get paid => 'Kostenpflichtig';

  @override
  String get openNow => 'Geöffnet';

  @override
  String get closedNow => 'Geschlossen';

  @override
  String get hoursUnknown => 'Öffnungszeiten unbekannt';

  @override
  String get hours => 'Öffnungszeiten';

  @override
  String get directions => 'Route';

  @override
  String get report => 'Problem melden';

  @override
  String get locateMe => 'Mein Standort';

  @override
  String get noResults =>
      'Keine Toilette passt zu diesen Filtern. Entferne einen.';

  @override
  String get loadError =>
      'Toiletten konnten nicht geladen werden. Prüfe deine Verbindung.';

  @override
  String get retry => 'Erneut versuchen';

  @override
  String get appearance => 'Darstellung';

  @override
  String get dynamicColor => 'Dynamische Farben';

  @override
  String get dynamicColorSub => 'Farben aus deinem Hintergrundbild';

  @override
  String get dynamicColorUnavailable => 'Auf diesem Gerät nicht verfügbar';

  @override
  String get presetPalettes => 'Farbpaletten';

  @override
  String get language => 'Sprache';

  @override
  String get followSystem => 'Systemsprache';

  @override
  String get dataAndUpdates => 'Daten und Aktualisierung';

  @override
  String get lastSync => 'Letzte Synchronisierung';

  @override
  String get neverSynced => 'Noch nicht synchronisiert';

  @override
  String get syncNow => 'Jetzt synchronisieren';

  @override
  String get syncNote =>
      'Wenn du die App öffnest und die letzte Synchronisierung über 24 Stunden her ist, wird deine Umgebung im Hintergrund aktualisiert.';

  @override
  String get privacy => 'Datenschutz';

  @override
  String get analytics => 'Anonyme Nutzungsstatistik';

  @override
  String get analyticsSub => 'Hilft uns, die App zu verbessern, ohne Standort';

  @override
  String get optionalOffByDefault => 'Optional, standardmäßig aus';

  @override
  String get readPolicy => 'Vollständige Datenschutzerklärung lesen';

  @override
  String get withdrawConsent => 'Einwilligung widerrufen';

  @override
  String get consentTitle => 'Bitte lies unsere Datenschutzerklärung';

  @override
  String get consentLead =>
      'Wir erheben nur, was zum Finden einer Toilette nötig ist.';

  @override
  String get consentPointLocation =>
      'Dein Standort bleibt auf deinem Handy und dient nur zur Suche nach Toiletten in der Nähe. Er wird nie auf unseren Servern gespeichert.';

  @override
  String get consentPointNoSale =>
      'Wir verkaufen keine Daten und nutzen kein Werbe-Tracking.';

  @override
  String get consentPointContrib =>
      'Deine Korrekturen und Bewertungen werden anonym angezeigt, um anderen zu helfen.';

  @override
  String get consentPointWithdraw =>
      'Du kannst deine Einwilligung jederzeit in den Einstellungen widerrufen oder deine Daten löschen.';

  @override
  String get agreeAndContinue => 'Zustimmen und weiter';

  @override
  String get decline => 'Ablehnen';

  @override
  String get declinedTitle => 'Deine Einwilligung wird benötigt';

  @override
  String get declinedBody =>
      'Ohne Zustimmung zur Datenschutzerklärung kann die App nicht genutzt werden. Du kannst sie jederzeit erneut ansehen.';

  @override
  String get reviewAgain => 'Datenschutzerklärung erneut ansehen';

  @override
  String get osmAttribution => '© OpenStreetMap-Mitwirkende';

  @override
  String get back => 'Zurück';

  @override
  String get close => 'Schließen';

  @override
  String get paletteLagoon => 'Lagune';

  @override
  String get paletteIndigo => 'Indigo';

  @override
  String get paletteForest => 'Wald';

  @override
  String get paletteRose => 'Rose';

  @override
  String get paletteAmber => 'Bernstein';

  @override
  String get paletteLavender => 'Lavendel';

  @override
  String get paletteBrick => 'Ziegel';

  @override
  String get paletteGraphite => 'Graphit';

  @override
  String get unnamedToilet => 'Öffentliche Toilette';

  @override
  String resultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Ergebnisse',
      one: '1 Ergebnis',
      zero: 'Keine Ergebnisse',
    );
    return '$_temp0';
  }

  @override
  String walkMinutes(int minutes) {
    return '$minutes Min. zu Fuß';
  }

  @override
  String sourceLine(String source) {
    return 'Quelle: $source';
  }
}

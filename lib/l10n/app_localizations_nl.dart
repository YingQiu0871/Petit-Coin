// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'Petit Coin';

  @override
  String get searchHint => 'Zoek plaatsen of toiletten';

  @override
  String get settings => 'Instellingen';

  @override
  String get nearby => 'Toiletten in de buurt';

  @override
  String get filterOpenNow => 'Nu open';

  @override
  String get filterFree => 'Gratis';

  @override
  String get filterAccessible => 'Toegankelijk';

  @override
  String get filterBabyChange => 'Verschoontafel';

  @override
  String get paid => 'Betaald';

  @override
  String get openNow => 'Open';

  @override
  String get closedNow => 'Gesloten';

  @override
  String get hoursUnknown => 'Openingstijden onbekend';

  @override
  String get hours => 'Openingstijden';

  @override
  String get directions => 'Route';

  @override
  String get report => 'Probleem melden';

  @override
  String get locateMe => 'Mijn locatie';

  @override
  String get noResults =>
      'Geen toiletten voor deze filters. Probeer er een weg te halen.';

  @override
  String get loadError =>
      'Toiletten konden niet worden geladen. Controleer je verbinding.';

  @override
  String get retry => 'Opnieuw';

  @override
  String get appearance => 'Weergave';

  @override
  String get dynamicColor => 'Dynamische kleuren';

  @override
  String get dynamicColorSub => 'Kleuren op basis van je achtergrond';

  @override
  String get dynamicColorUnavailable => 'Niet ondersteund op dit apparaat';

  @override
  String get presetPalettes => 'Kleurenpaletten';

  @override
  String get language => 'Taal';

  @override
  String get followSystem => 'Systeemtaal';

  @override
  String get dataAndUpdates => 'Gegevens en updates';

  @override
  String get lastSync => 'Laatst gesynchroniseerd';

  @override
  String get neverSynced => 'Nog niet gesynchroniseerd';

  @override
  String get syncNow => 'Nu synchroniseren';

  @override
  String get syncNote =>
      'Als je de app opent en de laatste synchronisatie meer dan 24 uur geleden is, wordt je omgeving op de achtergrond bijgewerkt.';

  @override
  String get privacy => 'Privacy';

  @override
  String get analytics => 'Anonieme gebruiksstatistieken';

  @override
  String get analyticsSub => 'Helpt ons de app te verbeteren, zonder locatie';

  @override
  String get optionalOffByDefault => 'Optioneel, standaard uit';

  @override
  String get readPolicy => 'Lees het volledige privacybeleid';

  @override
  String get withdrawConsent => 'Toestemming intrekken';

  @override
  String get consentTitle => 'Lees ons privacybeleid';

  @override
  String get consentLead =>
      'We verzamelen alleen wat nodig is om een toilet te vinden.';

  @override
  String get consentPointLocation =>
      'Je locatie blijft op je telefoon om toiletten in de buurt te vinden. Die wordt nooit op onze servers opgeslagen.';

  @override
  String get consentPointNoSale =>
      'We verkopen nooit gegevens en gebruiken geen advertentietracking.';

  @override
  String get consentPointContrib =>
      'Je correcties en beoordelingen worden anoniem getoond om anderen te helpen.';

  @override
  String get consentPointWithdraw =>
      'Je kunt je toestemming altijd intrekken of je gegevens verwijderen in Instellingen.';

  @override
  String get agreeAndContinue => 'Akkoord en doorgaan';

  @override
  String get decline => 'Weigeren';

  @override
  String get declinedTitle => 'Je toestemming is nodig';

  @override
  String get declinedBody =>
      'Zonder akkoord met het privacybeleid kun je de app niet gebruiken. Je kunt het altijd opnieuw bekijken.';

  @override
  String get reviewAgain => 'Privacybeleid opnieuw bekijken';

  @override
  String get osmAttribution => '© OpenStreetMap-bijdragers';

  @override
  String get back => 'Terug';

  @override
  String get close => 'Sluiten';

  @override
  String get paletteLagoon => 'Lagune';

  @override
  String get paletteIndigo => 'Indigo';

  @override
  String get paletteForest => 'Bos';

  @override
  String get paletteRose => 'Roos';

  @override
  String get paletteAmber => 'Amber';

  @override
  String get paletteLavender => 'Lavendel';

  @override
  String get paletteBrick => 'Baksteen';

  @override
  String get paletteGraphite => 'Grafiet';

  @override
  String get unnamedToilet => 'Openbaar toilet';

  @override
  String resultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count resultaten',
      one: '1 resultaat',
      zero: 'Geen resultaten',
    );
    return '$_temp0';
  }

  @override
  String walkMinutes(int minutes) {
    return '$minutes min lopen';
  }

  @override
  String sourceLine(String source) {
    return 'Bron: $source';
  }
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Petit Coin';

  @override
  String get searchHint => 'Szukaj miejsc lub toalet';

  @override
  String get settings => 'Ustawienia';

  @override
  String get nearby => 'Toalety w pobliżu';

  @override
  String get filterOpenNow => 'Otwarte teraz';

  @override
  String get filterFree => 'Bezpłatne';

  @override
  String get filterAccessible => 'Dostępne';

  @override
  String get filterBabyChange => 'Przewijak';

  @override
  String get paid => 'Płatne';

  @override
  String get openNow => 'Otwarte';

  @override
  String get closedNow => 'Zamknięte';

  @override
  String get hoursUnknown => 'Godziny nieznane';

  @override
  String get hours => 'Godziny otwarcia';

  @override
  String get directions => 'Trasa';

  @override
  String get report => 'Zgłoś problem';

  @override
  String get locateMe => 'Moja lokalizacja';

  @override
  String get noResults =>
      'Żadna toaleta nie pasuje do filtrów. Spróbuj usunąć jeden.';

  @override
  String get loadError => 'Nie udało się wczytać toalet. Sprawdź połączenie.';

  @override
  String get retry => 'Spróbuj ponownie';

  @override
  String get appearance => 'Wygląd';

  @override
  String get dynamicColor => 'Dynamiczne kolory';

  @override
  String get dynamicColorSub => 'Kolory dopasowane do tapety';

  @override
  String get dynamicColorUnavailable => 'Nieobsługiwane na tym urządzeniu';

  @override
  String get presetPalettes => 'Gotowe palety';

  @override
  String get language => 'Język';

  @override
  String get followSystem => 'Język systemu';

  @override
  String get dataAndUpdates => 'Dane i aktualizacje';

  @override
  String get lastSync => 'Ostatnia synchronizacja';

  @override
  String get neverSynced => 'Jeszcze nie zsynchronizowano';

  @override
  String get syncNow => 'Synchronizuj teraz';

  @override
  String get syncNote =>
      'Gdy otworzysz aplikację, a ostatnia synchronizacja była ponad 24 godziny temu, Twoja okolica odświeży się w tle.';

  @override
  String get privacy => 'Prywatność';

  @override
  String get analytics => 'Anonimowe statystyki użycia';

  @override
  String get analyticsSub => 'Pomagają ulepszać aplikację, bez lokalizacji';

  @override
  String get optionalOffByDefault => 'Opcjonalne, domyślnie wyłączone';

  @override
  String get readPolicy => 'Przeczytaj pełną politykę prywatności';

  @override
  String get withdrawConsent => 'Wycofaj zgodę';

  @override
  String get consentTitle => 'Przeczytaj naszą politykę prywatności';

  @override
  String get consentLead =>
      'Zbieramy tylko to, co potrzebne do znalezienia toalety.';

  @override
  String get consentPointLocation =>
      'Twoja lokalizacja zostaje w telefonie i służy do wyszukiwania toalet w pobliżu. Nigdy nie zapisujemy jej na naszych serwerach.';

  @override
  String get consentPointNoSale =>
      'Nie sprzedajemy danych i nie używamy śledzenia reklamowego.';

  @override
  String get consentPointContrib =>
      'Twoje poprawki i oceny są pokazywane anonimowo, by pomóc innym.';

  @override
  String get consentPointWithdraw =>
      'W każdej chwili możesz wycofać zgodę lub usunąć dane w Ustawieniach.';

  @override
  String get agreeAndContinue => 'Akceptuję i kontynuuję';

  @override
  String get decline => 'Odrzuć';

  @override
  String get declinedTitle => 'Potrzebna jest Twoja zgoda';

  @override
  String get declinedBody =>
      'Bez akceptacji polityki prywatności nie można korzystać z aplikacji. Możesz ją przejrzeć ponownie w każdej chwili.';

  @override
  String get reviewAgain => 'Przejrzyj politykę prywatności';

  @override
  String get osmAttribution => '© Współtwórcy OpenStreetMap';

  @override
  String get back => 'Wstecz';

  @override
  String get close => 'Zamknij';

  @override
  String get paletteLagoon => 'Laguna';

  @override
  String get paletteIndigo => 'Indygo';

  @override
  String get paletteForest => 'Las';

  @override
  String get paletteRose => 'Róża';

  @override
  String get paletteAmber => 'Bursztyn';

  @override
  String get paletteLavender => 'Lawenda';

  @override
  String get paletteBrick => 'Cegła';

  @override
  String get paletteGraphite => 'Grafit';

  @override
  String get unnamedToilet => 'Toaleta publiczna';

  @override
  String resultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count wyniku',
      many: '$count wyników',
      few: '$count wyniki',
      one: '1 wynik',
      zero: 'Brak wyników',
    );
    return '$_temp0';
  }

  @override
  String walkMinutes(int minutes) {
    return '$minutes min pieszo';
  }

  @override
  String sourceLine(String source) {
    return 'Źródło: $source';
  }
}

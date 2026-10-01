// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Petit Coin';

  @override
  String get searchHint => 'Cerca luoghi o bagni';

  @override
  String get settings => 'Impostazioni';

  @override
  String get nearby => 'Bagni nelle vicinanze';

  @override
  String get filterOpenNow => 'Aperto ora';

  @override
  String get filterFree => 'Gratuito';

  @override
  String get filterAccessible => 'Accessibile';

  @override
  String get filterBabyChange => 'Fasciatoio';

  @override
  String get paid => 'A pagamento';

  @override
  String get openNow => 'Aperto';

  @override
  String get closedNow => 'Chiuso';

  @override
  String get hoursUnknown => 'Orari sconosciuti';

  @override
  String get hours => 'Orari';

  @override
  String get directions => 'Indicazioni';

  @override
  String get report => 'Segnala un problema';

  @override
  String get locateMe => 'La mia posizione';

  @override
  String get noResults =>
      'Nessun bagno corrisponde a questi filtri. Prova a toglierne uno.';

  @override
  String get loadError =>
      'Impossibile caricare i bagni. Controlla la connessione.';

  @override
  String get retry => 'Riprova';

  @override
  String get appearance => 'Aspetto';

  @override
  String get dynamicColor => 'Colori dinamici';

  @override
  String get dynamicColorSub => 'Colori generati dal tuo sfondo';

  @override
  String get dynamicColorUnavailable => 'Non supportato su questo dispositivo';

  @override
  String get presetPalettes => 'Palette predefinite';

  @override
  String get language => 'Lingua';

  @override
  String get followSystem => 'Lingua di sistema';

  @override
  String get dataAndUpdates => 'Dati e aggiornamenti';

  @override
  String get lastSync => 'Ultima sincronizzazione';

  @override
  String get neverSynced => 'Non ancora sincronizzato';

  @override
  String get syncNow => 'Sincronizza ora';

  @override
  String get syncNote =>
      'Quando apri l\'app e l\'ultima sincronizzazione risale a più di 24 ore fa, la tua zona si aggiorna in background.';

  @override
  String get privacy => 'Privacy';

  @override
  String get analytics => 'Statistiche d\'uso anonime';

  @override
  String get analyticsSub => 'Ci aiutano a migliorare l\'app, senza posizione';

  @override
  String get optionalOffByDefault =>
      'Facoltativo, disattivato per impostazione predefinita';

  @override
  String get readPolicy => 'Leggi l\'informativa sulla privacy completa';

  @override
  String get withdrawConsent => 'Revoca il consenso';

  @override
  String get consentTitle => 'Leggi la nostra informativa sulla privacy';

  @override
  String get consentLead =>
      'Raccogliamo solo ciò che serve per trovare un bagno.';

  @override
  String get consentPointLocation =>
      'La tua posizione resta sul telefono per trovare i bagni vicini. Non viene mai salvata sui nostri server.';

  @override
  String get consentPointNoSale =>
      'Non vendiamo dati e non usiamo tracciamento pubblicitario.';

  @override
  String get consentPointContrib =>
      'Le tue correzioni e valutazioni vengono mostrate in forma anonima per aiutare gli altri.';

  @override
  String get consentPointWithdraw =>
      'Puoi revocare il consenso o eliminare i tuoi dati nelle Impostazioni in qualsiasi momento.';

  @override
  String get agreeAndContinue => 'Accetta e continua';

  @override
  String get decline => 'Rifiuta';

  @override
  String get declinedTitle => 'Serve il tuo consenso';

  @override
  String get declinedBody =>
      'Senza accettare l\'informativa sulla privacy non è possibile usare l\'app. Puoi rileggerla in qualsiasi momento.';

  @override
  String get reviewAgain => 'Rileggi l\'informativa sulla privacy';

  @override
  String get osmAttribution => '© Contributori di OpenStreetMap';

  @override
  String get back => 'Indietro';

  @override
  String get close => 'Chiudi';

  @override
  String get paletteLagoon => 'Laguna';

  @override
  String get paletteIndigo => 'Indaco';

  @override
  String get paletteForest => 'Foresta';

  @override
  String get paletteRose => 'Rosa';

  @override
  String get paletteAmber => 'Ambra';

  @override
  String get paletteLavender => 'Lavanda';

  @override
  String get paletteBrick => 'Mattone';

  @override
  String get paletteGraphite => 'Grafite';

  @override
  String get unnamedToilet => 'Bagno pubblico';

  @override
  String resultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count risultati',
      one: '1 risultato',
      zero: 'Nessun risultato',
    );
    return '$_temp0';
  }

  @override
  String walkMinutes(int minutes) {
    return '$minutes min a piedi';
  }

  @override
  String sourceLine(String source) {
    return 'Fonte: $source';
  }
}

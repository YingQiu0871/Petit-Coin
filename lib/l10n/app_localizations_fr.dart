// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Petit Coin';

  @override
  String get searchHint => 'Rechercher un lieu ou des toilettes';

  @override
  String get settings => 'Réglages';

  @override
  String get nearby => 'Toilettes à proximité';

  @override
  String get filterOpenNow => 'Ouvert';

  @override
  String get filterFree => 'Gratuit';

  @override
  String get filterAccessible => 'PMR';

  @override
  String get filterBabyChange => 'Table à langer';

  @override
  String get paid => 'Payant';

  @override
  String get openNow => 'Ouvert';

  @override
  String get closedNow => 'Fermé';

  @override
  String get hoursUnknown => 'Horaires inconnus';

  @override
  String get hours => 'Horaires';

  @override
  String get directions => 'Itinéraire';

  @override
  String get report => 'Signaler';

  @override
  String get locateMe => 'Ma position';

  @override
  String get noResults => 'Aucune toilette ne correspond. Retirez un filtre.';

  @override
  String get loadError =>
      'Impossible de charger les toilettes. Vérifiez votre connexion.';

  @override
  String get retry => 'Réessayer';

  @override
  String get appearance => 'Apparence';

  @override
  String get dynamicColor => 'Couleurs dynamiques';

  @override
  String get dynamicColorSub => 'Palette tirée de votre fond d’écran';

  @override
  String get dynamicColorUnavailable => 'Non disponible sur cet appareil';

  @override
  String get presetPalettes => 'Palettes prédéfinies';

  @override
  String get language => 'Langue';

  @override
  String get followSystem => 'Langue du système';

  @override
  String get dataAndUpdates => 'Données et mises à jour';

  @override
  String get lastSync => 'Dernière synchro';

  @override
  String get neverSynced => 'Pas encore synchronisé';

  @override
  String get syncNow => 'Synchroniser';

  @override
  String get syncNote =>
      'À l’ouverture, si la dernière synchro date de plus de 24 h, votre zone est actualisée en arrière-plan.';

  @override
  String get privacy => 'Confidentialité';

  @override
  String get analytics => 'Statistiques anonymes';

  @override
  String get analyticsSub => 'Pour améliorer l’app, sans position';

  @override
  String get optionalOffByDefault => 'Facultatif, désactivé par défaut';

  @override
  String get readPolicy => 'Lire la politique de confidentialité';

  @override
  String get withdrawConsent => 'Retirer mon consentement';

  @override
  String get consentTitle => 'Avant de commencer';

  @override
  String get consentLead =>
      'Nous ne collectons que le nécessaire pour trouver des toilettes.';

  @override
  String get consentPointLocation =>
      'Votre position reste sur votre téléphone. Elle n’est jamais stockée sur nos serveurs.';

  @override
  String get consentPointNoSale =>
      'Aucune revente de données, aucun pistage publicitaire.';

  @override
  String get consentPointContrib =>
      'Vos corrections et notes sont publiées anonymement.';

  @override
  String get consentPointWithdraw =>
      'Vous pouvez retirer votre consentement ou supprimer vos données dans les Réglages.';

  @override
  String get agreeAndContinue => 'Accepter et continuer';

  @override
  String get decline => 'Refuser';

  @override
  String get declinedTitle => 'Votre consentement est nécessaire';

  @override
  String get declinedBody =>
      'L’application ne peut pas être utilisée sans accepter la politique de confidentialité. Vous pouvez la relire à tout moment.';

  @override
  String get reviewAgain => 'Relire la politique';

  @override
  String get osmAttribution => '© Contributeurs OpenStreetMap';

  @override
  String get back => 'Retour';

  @override
  String get close => 'Fermer';

  @override
  String get paletteLagoon => 'Lagon';

  @override
  String get paletteIndigo => 'Indigo';

  @override
  String get paletteForest => 'Forêt';

  @override
  String get paletteRose => 'Rose';

  @override
  String get paletteAmber => 'Ambre';

  @override
  String get paletteLavender => 'Lavande';

  @override
  String get paletteBrick => 'Brique';

  @override
  String get paletteGraphite => 'Graphite';

  @override
  String get unnamedToilet => 'Toilettes publiques';

  @override
  String resultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count résultats',
      one: '1 résultat',
      zero: 'Aucun résultat',
    );
    return '$_temp0';
  }

  @override
  String walkMinutes(int minutes) {
    return '$minutes min à pied';
  }

  @override
  String sourceLine(String source) {
    return 'Source : $source';
  }
}

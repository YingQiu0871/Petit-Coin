// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Petit Coin';

  @override
  String get searchHint => 'Pesquisar locais ou casas de banho';

  @override
  String get settings => 'Definições';

  @override
  String get nearby => 'Casas de banho por perto';

  @override
  String get filterOpenNow => 'Aberto agora';

  @override
  String get filterFree => 'Grátis';

  @override
  String get filterAccessible => 'Acessível';

  @override
  String get filterBabyChange => 'Fraldário';

  @override
  String get paid => 'Pago';

  @override
  String get openNow => 'Aberto';

  @override
  String get closedNow => 'Fechado';

  @override
  String get hoursUnknown => 'Horário desconhecido';

  @override
  String get hours => 'Horário';

  @override
  String get directions => 'Direções';

  @override
  String get report => 'Comunicar problema';

  @override
  String get locateMe => 'A minha localização';

  @override
  String get noResults =>
      'Nenhuma casa de banho corresponde a estes filtros. Experimente remover um.';

  @override
  String get loadError =>
      'Não foi possível carregar as casas de banho. Verifique a ligação.';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get appearance => 'Aspeto';

  @override
  String get dynamicColor => 'Cor dinâmica';

  @override
  String get dynamicColorSub => 'Cores geradas a partir da sua imagem de fundo';

  @override
  String get dynamicColorUnavailable => 'Não suportado neste dispositivo';

  @override
  String get presetPalettes => 'Paletas predefinidas';

  @override
  String get language => 'Idioma';

  @override
  String get followSystem => 'Idioma do sistema';

  @override
  String get dataAndUpdates => 'Dados e atualizações';

  @override
  String get lastSync => 'Última sincronização';

  @override
  String get neverSynced => 'Ainda não sincronizado';

  @override
  String get syncNow => 'Sincronizar agora';

  @override
  String get syncNote =>
      'Ao abrir a app, se a última sincronização tiver mais de 24 horas, a sua zona é atualizada em segundo plano.';

  @override
  String get privacy => 'Privacidade';

  @override
  String get analytics => 'Estatísticas de utilização anónimas';

  @override
  String get analyticsSub => 'Ajudam-nos a melhorar a app, sem localização';

  @override
  String get optionalOffByDefault => 'Opcional, desativado por predefinição';

  @override
  String get readPolicy => 'Ler a política de privacidade completa';

  @override
  String get withdrawConsent => 'Retirar o consentimento';

  @override
  String get consentTitle => 'Leia a nossa política de privacidade';

  @override
  String get consentLead =>
      'Só recolhemos o necessário para encontrar uma casa de banho.';

  @override
  String get consentPointLocation =>
      'A sua localização fica no telemóvel para encontrar casas de banho por perto. Nunca é guardada nos nossos servidores.';

  @override
  String get consentPointNoSale =>
      'Nunca vendemos dados nem usamos rastreio publicitário.';

  @override
  String get consentPointContrib =>
      'As suas correções e avaliações são mostradas de forma anónima para ajudar outras pessoas.';

  @override
  String get consentPointWithdraw =>
      'Pode retirar o consentimento ou apagar os seus dados nas Definições a qualquer momento.';

  @override
  String get agreeAndContinue => 'Aceitar e continuar';

  @override
  String get decline => 'Recusar';

  @override
  String get declinedTitle => 'Precisamos do seu consentimento';

  @override
  String get declinedBody =>
      'Não é possível usar a app sem aceitar a política de privacidade. Pode revê-la a qualquer momento.';

  @override
  String get reviewAgain => 'Rever a política de privacidade';

  @override
  String get osmAttribution => '© Contribuidores do OpenStreetMap';

  @override
  String get back => 'Voltar';

  @override
  String get close => 'Fechar';

  @override
  String get paletteLagoon => 'Lagoa';

  @override
  String get paletteIndigo => 'Índigo';

  @override
  String get paletteForest => 'Floresta';

  @override
  String get paletteRose => 'Rosa';

  @override
  String get paletteAmber => 'Âmbar';

  @override
  String get paletteLavender => 'Lavanda';

  @override
  String get paletteBrick => 'Tijolo';

  @override
  String get paletteGraphite => 'Grafite';

  @override
  String get unnamedToilet => 'Casa de banho pública';

  @override
  String resultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count resultados',
      one: '1 resultado',
      zero: 'Sem resultados',
    );
    return '$_temp0';
  }

  @override
  String walkMinutes(int minutes) {
    return '$minutes min a pé';
  }

  @override
  String sourceLine(String source) {
    return 'Fonte: $source';
  }
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Petit Coin';

  @override
  String get searchHint => 'Buscar lugares o baños';

  @override
  String get settings => 'Ajustes';

  @override
  String get nearby => 'Baños cercanos';

  @override
  String get filterOpenNow => 'Abierto ahora';

  @override
  String get filterFree => 'Gratis';

  @override
  String get filterAccessible => 'Accesible';

  @override
  String get filterBabyChange => 'Cambiador';

  @override
  String get paid => 'De pago';

  @override
  String get openNow => 'Abierto';

  @override
  String get closedNow => 'Cerrado';

  @override
  String get hoursUnknown => 'Horario desconocido';

  @override
  String get hours => 'Horario';

  @override
  String get directions => 'Cómo llegar';

  @override
  String get report => 'Informar de un problema';

  @override
  String get locateMe => 'Mi ubicación';

  @override
  String get noResults =>
      'Ningún baño coincide con estos filtros. Prueba a quitar uno.';

  @override
  String get loadError =>
      'No se pudieron cargar los baños. Comprueba tu conexión.';

  @override
  String get retry => 'Reintentar';

  @override
  String get appearance => 'Apariencia';

  @override
  String get dynamicColor => 'Color dinámico';

  @override
  String get dynamicColorSub =>
      'Colores generados a partir de tu fondo de pantalla';

  @override
  String get dynamicColorUnavailable => 'No disponible en este dispositivo';

  @override
  String get presetPalettes => 'Paletas predefinidas';

  @override
  String get language => 'Idioma';

  @override
  String get followSystem => 'Idioma del sistema';

  @override
  String get dataAndUpdates => 'Datos y actualizaciones';

  @override
  String get lastSync => 'Última sincronización';

  @override
  String get neverSynced => 'Aún sin sincronizar';

  @override
  String get syncNow => 'Sincronizar ahora';

  @override
  String get syncNote =>
      'Al abrir la app, si la última sincronización tiene más de 24 horas, tu zona se actualiza en segundo plano.';

  @override
  String get privacy => 'Privacidad';

  @override
  String get analytics => 'Estadísticas de uso anónimas';

  @override
  String get analyticsSub => 'Nos ayudan a mejorar la app, sin ubicación';

  @override
  String get optionalOffByDefault => 'Opcional, desactivado por defecto';

  @override
  String get readPolicy => 'Leer la política de privacidad completa';

  @override
  String get withdrawConsent => 'Retirar el consentimiento';

  @override
  String get consentTitle => 'Lee nuestra política de privacidad';

  @override
  String get consentLead =>
      'Solo recogemos lo necesario para encontrar un baño.';

  @override
  String get consentPointLocation =>
      'Tu ubicación se queda en tu teléfono para encontrar baños cercanos. Nunca se guarda en nuestros servidores.';

  @override
  String get consentPointNoSale =>
      'Nunca vendemos datos ni usamos seguimiento publicitario.';

  @override
  String get consentPointContrib =>
      'Tus correcciones y valoraciones se muestran de forma anónima para ayudar a otros.';

  @override
  String get consentPointWithdraw =>
      'Puedes retirar tu consentimiento o borrar tus datos en Ajustes cuando quieras.';

  @override
  String get agreeAndContinue => 'Aceptar y continuar';

  @override
  String get decline => 'Rechazar';

  @override
  String get declinedTitle => 'Necesitamos tu consentimiento';

  @override
  String get declinedBody =>
      'No se puede usar la app sin aceptar la política de privacidad. Puedes volver a revisarla cuando quieras.';

  @override
  String get reviewAgain => 'Revisar la política de privacidad';

  @override
  String get osmAttribution => '© Colaboradores de OpenStreetMap';

  @override
  String get back => 'Atrás';

  @override
  String get close => 'Cerrar';

  @override
  String get paletteLagoon => 'Laguna';

  @override
  String get paletteIndigo => 'Índigo';

  @override
  String get paletteForest => 'Bosque';

  @override
  String get paletteRose => 'Rosa';

  @override
  String get paletteAmber => 'Ámbar';

  @override
  String get paletteLavender => 'Lavanda';

  @override
  String get paletteBrick => 'Ladrillo';

  @override
  String get paletteGraphite => 'Grafito';

  @override
  String get unnamedToilet => 'Baño público';

  @override
  String resultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count resultados',
      one: '1 resultado',
      zero: 'Sin resultados',
    );
    return '$_temp0';
  }

  @override
  String walkMinutes(int minutes) {
    return '$minutes min a pie';
  }

  @override
  String sourceLine(String source) {
    return 'Fuente: $source';
  }
}

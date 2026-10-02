import 'package:dynamic_color/dynamic_color.dart';
import 'package:material_ui/material_ui.dart';

import 'data/toilet_repository.dart';
import 'l10n/app_localizations.dart';
import 'map/map_screen.dart';
import 'privacy/consent_screen.dart';
import 'settings/app_settings.dart';
import 'theme/app_theme.dart';

class PetitCoinApp extends StatelessWidget {
  const PetitCoinApp({
    super.key,
    required this.settings,
    required this.repository,
    this.home,
  });

  final AppSettings settings;
  final ToiletRepository repository;

  /// Replaces the map screen; used by tests, where platform views are absent.
  final Widget? home;

  @override
  Widget build(BuildContext context) {
    return SettingsScope(
      settings: settings,
      child: ListenableBuilder(
        listenable: settings,
        builder: (context, _) => DynamicColorBuilder(
          builder: (lightDynamic, darkDynamic) {
            ColorScheme scheme(Brightness b, ColorScheme? dyn) => resolveScheme(
              brightness: b,
              useDynamic: settings.dynamicColor,
              dynamicScheme: dyn,
              presetSeed: settings.palette.seed,
            );
            return MaterialApp(
              onGenerateTitle: (c) => AppLocalizations.of(c).appTitle,
              debugShowCheckedModeBanner: false,
              theme: buildTheme(scheme(Brightness.light, lightDynamic)),
              darkTheme: buildTheme(scheme(Brightness.dark, darkDynamic)),
              locale: settings.locale,
              supportedLocales: AppLocalizations.supportedLocales,
              localeListResolutionCallback: (locales, _) {
                for (final l in locales ?? const <Locale>[]) {
                  final code = AppSettings.codeForLocale(l);
                  if (code != null) return AppSettings.localeFromCode(code);
                }
                return const Locale('en');
              },
              localizationsDelegates: const [
                AppLocalizations.delegate,
                ...GlobalMaterialLocalizations.delegates,
              ],
              home: settings.hasConsented
                  ? home ?? MapScreen(repository: repository)
                  : const ConsentScreen(),
            );
          },
        ),
      ),
    );
  }
}

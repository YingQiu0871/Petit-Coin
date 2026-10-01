import 'package:material_ui/material_ui.dart';

ThemeData buildTheme(ColorScheme scheme) {
  return ThemeData(
    colorScheme: scheme,
    useMaterial3: true,
    fontFamilyFallback: const ['Noto Sans SC', 'PingFang SC'],
    chipTheme: const ChipThemeData(showCheckmark: true),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    ),
  );
}

/// Builds a scheme from the device's dynamic palette when allowed and
/// available, otherwise from the chosen preset seed.
ColorScheme resolveScheme({
  required Brightness brightness,
  required bool useDynamic,
  required ColorScheme? dynamicScheme,
  required Color presetSeed,
}) {
  if (useDynamic && dynamicScheme != null) return dynamicScheme;
  return ColorScheme.fromSeed(seedColor: presetSeed, brightness: brightness);
}

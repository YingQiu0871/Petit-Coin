import 'package:material_ui/material_ui.dart';

import '../l10n/app_localizations.dart';

/// The eight preset seed colors offered when dynamic color is off.
enum Palette {
  lagoon(Color(0xFF00677F)),
  indigo(Color(0xFF3F5AA9)),
  forest(Color(0xFF2E6B30)),
  rose(Color(0xFF8B4A62)),
  amber(Color(0xFF8A5100)),
  lavender(Color(0xFF6750A4)),
  brick(Color(0xFFA13D2D)),
  graphite(Color(0xFF4E5B61));

  const Palette(this.seed);

  final Color seed;

  String label(AppLocalizations l10n) => switch (this) {
    Palette.lagoon => l10n.paletteLagoon,
    Palette.indigo => l10n.paletteIndigo,
    Palette.forest => l10n.paletteForest,
    Palette.rose => l10n.paletteRose,
    Palette.amber => l10n.paletteAmber,
    Palette.lavender => l10n.paletteLavender,
    Palette.brick => l10n.paletteBrick,
    Palette.graphite => l10n.paletteGraphite,
  };
}

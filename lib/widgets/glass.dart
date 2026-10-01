import 'dart:ui';

import 'package:material_ui/material_ui.dart';

/// A frosted, translucent surface for layers that float over the map.
///
/// Falls back to an opaque surface when the platform asks for high
/// contrast, so text stays readable over busy map tiles.
class GlassSurface extends StatelessWidget {
  const GlassSurface({
    super.key,
    required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(28)),
    this.padding = EdgeInsets.zero,
    this.opacity = 0.68,
    this.blurSigma = 22,
  });

  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
  final double opacity;
  final double blurSigma;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final solid = MediaQuery.highContrastOf(context);
    final fill = solid
        ? scheme.surfaceContainerHigh
        : scheme.surfaceContainerHigh.withValues(alpha: opacity);
    final decorated = DecoratedBox(
      decoration: BoxDecoration(
        color: fill,
        borderRadius: borderRadius,
        border: Border.all(color: scheme.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: Padding(padding: padding, child: child),
    );
    return Material(
      type: MaterialType.transparency,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: solid
            ? decorated
            : BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
                child: decorated,
              ),
      ),
    );
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:petit_coin/app.dart';
import 'package:petit_coin/data/toilet_repository.dart';
import 'package:petit_coin/map/map_screen.dart';
import 'package:petit_coin/settings/app_settings.dart';
import 'package:petit_coin/settings/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Runs on a real device or emulator: consent, map, settings.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('first launch: consent, then map and settings', (tester) async {
    SharedPreferences.setMockInitialValues({'locale': 'en'});
    final settings = await AppSettings.load();
    await tester.pumpWidget(
      PetitCoinApp(settings: settings, repository: ToiletRepository()),
    );
    await tester.pumpAndSettle();

    expect(find.text('Please read our privacy policy'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('Agree and continue'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Agree and continue'));
    await tester.pump(const Duration(seconds: 3));

    expect(find.byType(MapScreen), findsOneWidget);
    expect(find.text('Toilets nearby'), findsOneWidget);

    await tester.tap(find.byTooltip('Settings'));
    await tester.pump(const Duration(seconds: 2));
    expect(find.byType(SettingsScreen), findsOneWidget);
    expect(find.text('Preset palettes'), findsOneWidget);
  });
}

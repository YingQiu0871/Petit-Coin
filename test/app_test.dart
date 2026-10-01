import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:petit_coin/app.dart';
import 'package:petit_coin/data/toilet_repository.dart';
import 'package:petit_coin/settings/app_settings.dart';
import 'package:petit_coin/theme/palettes.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<AppSettings> _settings([Map<String, Object> values = const {}]) {
  SharedPreferences.setMockInitialValues(values);
  return AppSettings.load();
}

/// A tall phone screen, so the whole consent page fits.
void _phone(WidgetTester tester) {
  tester.view.physicalSize = const Size(1290, 2796);
  tester.view.devicePixelRatio = 3;
  addTearDown(tester.view.reset);
}

Widget _app(AppSettings s) => PetitCoinApp(
  settings: s,
  repository: ToiletRepository(),
  home: const Scaffold(body: Text('HOME')),
);

Future<void> _tapText(WidgetTester tester, String text) async {
  await tester.scrollUntilVisible(
    find.text(text),
    200,
    scrollable: find.byType(Scrollable).first,
  );
  await tester.tap(find.text(text));
  await tester.pumpAndSettle();
}

void main() {
  group('settings', () {
    test('defaults: dynamic color on, system language, no consent', () async {
      final s = await _settings();
      expect(s.dynamicColor, isTrue);
      expect(s.localeCode, isNull);
      expect(s.analytics, isFalse);
      expect(s.hasConsented, isFalse);
    });

    test('choosing a preset turns dynamic color off and persists', () async {
      final s = await _settings();
      s.choosePalette(Palette.forest);
      expect(s.dynamicColor, isFalse);
      final reloaded = await AppSettings.load();
      expect(reloaded.palette, Palette.forest);
      expect(reloaded.dynamicColor, isFalse);
    });

    test('withdrawing consent also turns analytics off', () async {
      final s = await _settings();
      s
        ..acceptPolicy()
        ..analytics = true
        ..withdrawConsent();
      expect(s.hasConsented, isFalse);
      expect(s.analytics, isFalse);
    });

    test('an older policy version asks again', () async {
      final s = await _settings({'acceptedPolicyVersion': 0});
      expect(s.hasConsented, isFalse);
    });
  });

  group('consent gate', () {
    testWidgets('must agree before reaching the app', (tester) async {
      final s = await _settings({'locale': 'en'});
      _phone(tester);
      await tester.pumpWidget(_app(s));
      await tester.pumpAndSettle();
      expect(find.text('HOME'), findsNothing);
      expect(find.text('Please read our privacy policy'), findsOneWidget);

      await _tapText(tester, 'Agree and continue');
      expect(find.text('HOME'), findsOneWidget);
      expect(s.hasConsented, isTrue);
    });

    testWidgets('declining keeps the user on the explanation', (tester) async {
      final s = await _settings({'locale': 'en'});
      _phone(tester);
      await tester.pumpWidget(_app(s));
      await tester.pumpAndSettle();
      await _tapText(tester, 'Decline');
      expect(find.text('Your consent is needed'), findsOneWidget);
      expect(find.text('HOME'), findsNothing);

      await _tapText(tester, 'Review the privacy policy');
      expect(find.text('Agree and continue'), findsOneWidget);
    });

    testWidgets('shows the chosen language', (tester) async {
      final s = await _settings({'locale': 'zh'});
      _phone(tester);
      await tester.pumpWidget(_app(s));
      await tester.pumpAndSettle();
      expect(find.text('使用前请阅读隐私条款'), findsOneWidget);

      s.localeCode = 'fr';
      await tester.pumpAndSettle();
      expect(find.text('Avant de commencer'), findsOneWidget);
    });
  });
}

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/palettes.dart';

/// User preferences, persisted on the device only.
class AppSettings extends ChangeNotifier {
  AppSettings._(this._prefs)
    : _dynamicColor = _prefs.getBool(_kDynamic) ?? true,
      _palette =
          Palette.values.asNameMap()[_prefs.getString(_kPalette)] ??
          Palette.lagoon,
      _localeCode = _prefs.getString(_kLocale),
      _analytics = _prefs.getBool(_kAnalytics) ?? false,
      _acceptedPolicyVersion = _prefs.getInt(_kPolicy);

  static Future<AppSettings> load() async =>
      AppSettings._(await SharedPreferences.getInstance());

  /// Bump when the privacy policy changes materially, so users are asked again.
  static const currentPolicyVersion = 1;

  /// Order shown in Settings. `zh_Hant` is Traditional Chinese.
  static const supportedLocaleCodes = [
    'zh',
    'zh_Hant',
    'en',
    'fr',
    'de',
    'es',
    'it',
    'pt',
    'nl',
    'pl',
    'ja',
    'ko',
  ];

  static Locale localeFromCode(String code) => switch (code.split('_')) {
    [final lang, final script] => Locale.fromSubtags(
      languageCode: lang,
      scriptCode: script,
    ),
    _ => Locale(code),
  };

  /// Maps a device locale to one of [supportedLocaleCodes], or null.
  /// Taiwan, Hong Kong and Macau get Traditional Chinese even when the
  /// device reports no script.
  static String? codeForLocale(Locale locale) {
    final code =
        locale.languageCode == 'zh' &&
            (locale.scriptCode == 'Hant' ||
                (locale.scriptCode == null &&
                    const {'TW', 'HK', 'MO'}.contains(locale.countryCode)))
        ? 'zh_Hant'
        : locale.languageCode;
    return supportedLocaleCodes.contains(code) ? code : null;
  }

  static const _kDynamic = 'dynamicColor';
  static const _kPalette = 'palette';
  static const _kLocale = 'locale';
  static const _kAnalytics = 'analytics';
  static const _kPolicy = 'acceptedPolicyVersion';

  final SharedPreferences _prefs;

  bool _dynamicColor;
  Palette _palette;
  String? _localeCode;
  bool _analytics;
  int? _acceptedPolicyVersion;

  bool get dynamicColor => _dynamicColor;
  Palette get palette => _palette;

  /// Null means follow the system language.
  String? get localeCode => _localeCode;
  Locale? get locale =>
      _localeCode == null ? null : localeFromCode(_localeCode!);
  bool get analytics => _analytics;
  bool get hasConsented => _acceptedPolicyVersion == currentPolicyVersion;

  set dynamicColor(bool value) {
    _dynamicColor = value;
    _prefs.setBool(_kDynamic, value);
    notifyListeners();
  }

  /// Picking a preset turns dynamic color off.
  void choosePalette(Palette value) {
    _palette = value;
    _dynamicColor = false;
    _prefs.setString(_kPalette, value.name);
    _prefs.setBool(_kDynamic, false);
    notifyListeners();
  }

  set localeCode(String? value) {
    assert(value == null || supportedLocaleCodes.contains(value));
    _localeCode = value;
    value == null ? _prefs.remove(_kLocale) : _prefs.setString(_kLocale, value);
    notifyListeners();
  }

  set analytics(bool value) {
    _analytics = value;
    _prefs.setBool(_kAnalytics, value);
    notifyListeners();
  }

  void acceptPolicy() {
    _acceptedPolicyVersion = currentPolicyVersion;
    _prefs.setInt(_kPolicy, currentPolicyVersion);
    notifyListeners();
  }

  void withdrawConsent() {
    _acceptedPolicyVersion = null;
    _analytics = false;
    _prefs.remove(_kPolicy);
    _prefs.setBool(_kAnalytics, false);
    notifyListeners();
  }
}

/// Makes [AppSettings] reachable from the widget tree.
class SettingsScope extends InheritedNotifier<AppSettings> {
  const SettingsScope({
    super.key,
    required AppSettings settings,
    required super.child,
  }) : super(notifier: settings);

  static AppSettings of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SettingsScope>()!.notifier!;
}

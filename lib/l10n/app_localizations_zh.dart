// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '方便点';

  @override
  String get searchHint => '搜索地点或厕所';

  @override
  String get settings => '设置';

  @override
  String get nearby => '附近的厕所';

  @override
  String get filterOpenNow => '正在开放';

  @override
  String get filterFree => '免费';

  @override
  String get filterAccessible => '无障碍';

  @override
  String get filterBabyChange => '母婴台';

  @override
  String get paid => '收费';

  @override
  String get openNow => '开放中';

  @override
  String get closedNow => '已关闭';

  @override
  String get hoursUnknown => '开放时间未知';

  @override
  String get hours => '开放时间';

  @override
  String get directions => '导航';

  @override
  String get report => '报告问题';

  @override
  String get locateMe => '定位到我';

  @override
  String get noResults => '没有符合筛选条件的厕所，试试减少筛选。';

  @override
  String get loadError => '无法加载厕所数据，请检查网络。';

  @override
  String get retry => '重试';

  @override
  String get appearance => '外观';

  @override
  String get dynamicColor => '动态取色';

  @override
  String get dynamicColorSub => '跟随手机壁纸自动生成配色';

  @override
  String get dynamicColorUnavailable => '此设备不支持';

  @override
  String get presetPalettes => '预制配色';

  @override
  String get language => '语言';

  @override
  String get followSystem => '跟随系统';

  @override
  String get dataAndUpdates => '数据与更新';

  @override
  String get lastSync => '上次同步';

  @override
  String get neverSynced => '尚未同步';

  @override
  String get syncNow => '立即同步';

  @override
  String get syncNote => '打开应用时，如果距离上次同步超过 24 小时，会在后台刷新你所在区域。';

  @override
  String get privacy => '隐私';

  @override
  String get analytics => '匿名使用统计';

  @override
  String get analyticsSub => '帮助我们改进应用，不含位置';

  @override
  String get optionalOffByDefault => '可选，默认关闭';

  @override
  String get readPolicy => '阅读完整隐私条款';

  @override
  String get withdrawConsent => '撤回同意';

  @override
  String get consentTitle => '使用前请阅读隐私条款';

  @override
  String get consentLead => '我们只收集找厕所必需的信息。';

  @override
  String get consentPointLocation => '位置只在你的手机上用来找附近的厕所，不会上传保存。';

  @override
  String get consentPointNoSale => '不出售数据，没有广告追踪。';

  @override
  String get consentPointContrib => '你提交的纠错和评分会匿名公开，帮助其他人。';

  @override
  String get consentPointWithdraw => '你可以随时在设置中撤回同意或删除数据。';

  @override
  String get agreeAndContinue => '同意并继续';

  @override
  String get decline => '不同意';

  @override
  String get declinedTitle => '需要你的同意才能继续';

  @override
  String get declinedBody => '不同意隐私条款就无法使用方便点。你可以随时重新查看并做出选择。';

  @override
  String get reviewAgain => '重新查看隐私条款';

  @override
  String get osmAttribution => '© OpenStreetMap 贡献者';

  @override
  String get back => '返回';

  @override
  String get close => '关闭';

  @override
  String get paletteLagoon => '湖青';

  @override
  String get paletteIndigo => '靛蓝';

  @override
  String get paletteForest => '森绿';

  @override
  String get paletteRose => '玫瑰';

  @override
  String get paletteAmber => '琥珀';

  @override
  String get paletteLavender => '薰衣草';

  @override
  String get paletteBrick => '砖红';

  @override
  String get paletteGraphite => '石墨';

  @override
  String get unnamedToilet => '公共厕所';

  @override
  String resultCount(int count) {
    return '$count 个结果';
  }

  @override
  String walkMinutes(int minutes) {
    return '步行 $minutes 分钟';
  }

  @override
  String sourceLine(String source) {
    return '来源：$source';
  }
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get appTitle => '方便點';

  @override
  String get searchHint => '搜尋地點或廁所';

  @override
  String get settings => '設定';

  @override
  String get nearby => '附近的廁所';

  @override
  String get filterOpenNow => '正在開放';

  @override
  String get filterFree => '免費';

  @override
  String get filterAccessible => '無障礙';

  @override
  String get filterBabyChange => '尿布台';

  @override
  String get paid => '收費';

  @override
  String get openNow => '開放中';

  @override
  String get closedNow => '已關閉';

  @override
  String get hoursUnknown => '開放時間不明';

  @override
  String get hours => '開放時間';

  @override
  String get directions => '導航';

  @override
  String get report => '回報問題';

  @override
  String get locateMe => '定位到我';

  @override
  String get noResults => '沒有符合篩選條件的廁所，試試減少篩選。';

  @override
  String get loadError => '無法載入廁所資料，請檢查網路。';

  @override
  String get retry => '重試';

  @override
  String get appearance => '外觀';

  @override
  String get dynamicColor => '動態取色';

  @override
  String get dynamicColorSub => '依手機桌布自動產生配色';

  @override
  String get dynamicColorUnavailable => '此裝置不支援';

  @override
  String get presetPalettes => '預設配色';

  @override
  String get language => '語言';

  @override
  String get followSystem => '跟隨系統';

  @override
  String get dataAndUpdates => '資料與更新';

  @override
  String get lastSync => '上次同步';

  @override
  String get neverSynced => '尚未同步';

  @override
  String get syncNow => '立即同步';

  @override
  String get syncNote => '開啟應用程式時，如果距離上次同步超過 24 小時，會在背景更新你所在的區域。';

  @override
  String get privacy => '隱私';

  @override
  String get analytics => '匿名使用統計';

  @override
  String get analyticsSub => '協助我們改進應用程式，不含位置';

  @override
  String get optionalOffByDefault => '選用，預設關閉';

  @override
  String get readPolicy => '閱讀完整隱私權條款';

  @override
  String get withdrawConsent => '撤回同意';

  @override
  String get consentTitle => '使用前請閱讀隱私權條款';

  @override
  String get consentLead => '我們只收集找廁所必需的資訊。';

  @override
  String get consentPointLocation => '位置只在你的手機上用來尋找附近的廁所，不會上傳保存。';

  @override
  String get consentPointNoSale => '不出售資料，沒有廣告追蹤。';

  @override
  String get consentPointContrib => '你提交的修正和評分會匿名公開，幫助其他人。';

  @override
  String get consentPointWithdraw => '你可以隨時在設定中撤回同意或刪除資料。';

  @override
  String get agreeAndContinue => '同意並繼續';

  @override
  String get decline => '不同意';

  @override
  String get declinedTitle => '需要你的同意才能繼續';

  @override
  String get declinedBody => '不同意隱私權條款就無法使用方便點。你可以隨時重新查看並做出選擇。';

  @override
  String get reviewAgain => '重新查看隱私權條款';

  @override
  String get osmAttribution => '© OpenStreetMap 貢獻者';

  @override
  String get back => '返回';

  @override
  String get close => '關閉';

  @override
  String get paletteLagoon => '湖青';

  @override
  String get paletteIndigo => '靛藍';

  @override
  String get paletteForest => '森綠';

  @override
  String get paletteRose => '玫瑰';

  @override
  String get paletteAmber => '琥珀';

  @override
  String get paletteLavender => '薰衣草';

  @override
  String get paletteBrick => '磚紅';

  @override
  String get paletteGraphite => '石墨';

  @override
  String get unnamedToilet => '公共廁所';

  @override
  String resultCount(int count) {
    return '$count 個結果';
  }

  @override
  String walkMinutes(int minutes) {
    return '步行 $minutes 分鐘';
  }

  @override
  String sourceLine(String source) {
    return '來源：$source';
  }
}

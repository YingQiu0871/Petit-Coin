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

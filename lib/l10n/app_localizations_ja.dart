// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Petit Coin';

  @override
  String get searchHint => '場所やトイレを検索';

  @override
  String get settings => '設定';

  @override
  String get nearby => '近くのトイレ';

  @override
  String get filterOpenNow => '営業中';

  @override
  String get filterFree => '無料';

  @override
  String get filterAccessible => 'バリアフリー';

  @override
  String get filterBabyChange => 'おむつ替え台';

  @override
  String get paid => '有料';

  @override
  String get openNow => '営業中';

  @override
  String get closedNow => '営業時間外';

  @override
  String get hoursUnknown => '営業時間不明';

  @override
  String get hours => '営業時間';

  @override
  String get directions => '経路';

  @override
  String get report => '問題を報告';

  @override
  String get locateMe => '現在地';

  @override
  String get noResults => '条件に合うトイレがありません。フィルタを減らしてみてください。';

  @override
  String get loadError => 'トイレを読み込めませんでした。接続を確認してください。';

  @override
  String get retry => '再試行';

  @override
  String get appearance => '外観';

  @override
  String get dynamicColor => 'ダイナミックカラー';

  @override
  String get dynamicColorSub => '壁紙から配色を生成';

  @override
  String get dynamicColorUnavailable => 'この端末では利用できません';

  @override
  String get presetPalettes => 'プリセット配色';

  @override
  String get language => '言語';

  @override
  String get followSystem => 'システムに従う';

  @override
  String get dataAndUpdates => 'データと更新';

  @override
  String get lastSync => '最終同期';

  @override
  String get neverSynced => '未同期';

  @override
  String get syncNow => '今すぐ同期';

  @override
  String get syncNote => 'アプリを開いたとき、最後の同期から24時間以上経っていれば、周辺のデータをバックグラウンドで更新します。';

  @override
  String get privacy => 'プライバシー';

  @override
  String get analytics => '匿名の利用統計';

  @override
  String get analyticsSub => 'アプリの改善に役立ちます。位置情報は含みません';

  @override
  String get optionalOffByDefault => '任意・初期設定はオフ';

  @override
  String get readPolicy => 'プライバシーポリシー全文を読む';

  @override
  String get withdrawConsent => '同意を取り消す';

  @override
  String get consentTitle => 'プライバシーポリシーをお読みください';

  @override
  String get consentLead => 'トイレを探すのに必要な情報だけを集めます。';

  @override
  String get consentPointLocation =>
      '位置情報は近くのトイレを探すために端末内でのみ使い、サーバーに保存することはありません。';

  @override
  String get consentPointNoSale => 'データの販売や広告トラッキングは一切行いません。';

  @override
  String get consentPointContrib => 'あなたの修正や評価は匿名で公開され、ほかの人の役に立ちます。';

  @override
  String get consentPointWithdraw => '設定からいつでも同意を取り消したり、データを削除したりできます。';

  @override
  String get agreeAndContinue => '同意して続ける';

  @override
  String get decline => '同意しない';

  @override
  String get declinedTitle => '同意が必要です';

  @override
  String get declinedBody => 'プライバシーポリシーに同意しないとアプリを利用できません。いつでも見直せます。';

  @override
  String get reviewAgain => 'プライバシーポリシーをもう一度見る';

  @override
  String get osmAttribution => '© OpenStreetMap 貢献者';

  @override
  String get back => '戻る';

  @override
  String get close => '閉じる';

  @override
  String get paletteLagoon => 'ラグーン';

  @override
  String get paletteIndigo => 'インディゴ';

  @override
  String get paletteForest => 'フォレスト';

  @override
  String get paletteRose => 'ローズ';

  @override
  String get paletteAmber => 'アンバー';

  @override
  String get paletteLavender => 'ラベンダー';

  @override
  String get paletteBrick => 'ブリック';

  @override
  String get paletteGraphite => 'グラファイト';

  @override
  String get unnamedToilet => '公衆トイレ';

  @override
  String resultCount(int count) {
    return '$count件';
  }

  @override
  String walkMinutes(int minutes) {
    return '徒歩$minutes分';
  }

  @override
  String sourceLine(String source) {
    return '出典：$source';
  }
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'Petit Coin';

  @override
  String get searchHint => '장소 또는 화장실 검색';

  @override
  String get settings => '설정';

  @override
  String get nearby => '근처 화장실';

  @override
  String get filterOpenNow => '지금 운영 중';

  @override
  String get filterFree => '무료';

  @override
  String get filterAccessible => '장애인 이용 가능';

  @override
  String get filterBabyChange => '기저귀 교환대';

  @override
  String get paid => '유료';

  @override
  String get openNow => '운영 중';

  @override
  String get closedNow => '운영 종료';

  @override
  String get hoursUnknown => '운영 시간 알 수 없음';

  @override
  String get hours => '운영 시간';

  @override
  String get directions => '길찾기';

  @override
  String get report => '문제 신고';

  @override
  String get locateMe => '내 위치';

  @override
  String get noResults => '필터에 맞는 화장실이 없습니다. 필터를 하나 해제해 보세요.';

  @override
  String get loadError => '화장실 정보를 불러오지 못했습니다. 연결을 확인하세요.';

  @override
  String get retry => '다시 시도';

  @override
  String get appearance => '화면';

  @override
  String get dynamicColor => '다이내믹 컬러';

  @override
  String get dynamicColorSub => '배경화면에서 색상 생성';

  @override
  String get dynamicColorUnavailable => '이 기기에서는 지원되지 않습니다';

  @override
  String get presetPalettes => '기본 팔레트';

  @override
  String get language => '언어';

  @override
  String get followSystem => '시스템 설정 따르기';

  @override
  String get dataAndUpdates => '데이터 및 업데이트';

  @override
  String get lastSync => '마지막 동기화';

  @override
  String get neverSynced => '아직 동기화하지 않음';

  @override
  String get syncNow => '지금 동기화';

  @override
  String get syncNote => '앱을 열 때 마지막 동기화가 24시간을 넘었다면 주변 지역을 백그라운드에서 새로 고칩니다.';

  @override
  String get privacy => '개인정보';

  @override
  String get analytics => '익명 사용 통계';

  @override
  String get analyticsSub => '앱 개선에 도움이 되며 위치는 포함하지 않습니다';

  @override
  String get optionalOffByDefault => '선택 사항, 기본값 꺼짐';

  @override
  String get readPolicy => '개인정보 처리방침 전문 보기';

  @override
  String get withdrawConsent => '동의 철회';

  @override
  String get consentTitle => '개인정보 처리방침을 읽어 주세요';

  @override
  String get consentLead => '화장실을 찾는 데 필요한 정보만 수집합니다.';

  @override
  String get consentPointLocation =>
      '위치는 근처 화장실을 찾기 위해 휴대전화 안에서만 사용하며 서버에 저장하지 않습니다.';

  @override
  String get consentPointNoSale => '데이터를 판매하지 않으며 광고 추적도 하지 않습니다.';

  @override
  String get consentPointContrib => '수정 사항과 평가는 익명으로 공개되어 다른 사람에게 도움이 됩니다.';

  @override
  String get consentPointWithdraw => '설정에서 언제든지 동의를 철회하거나 데이터를 삭제할 수 있습니다.';

  @override
  String get agreeAndContinue => '동의하고 계속';

  @override
  String get decline => '동의 안 함';

  @override
  String get declinedTitle => '동의가 필요합니다';

  @override
  String get declinedBody =>
      '개인정보 처리방침에 동의하지 않으면 앱을 사용할 수 없습니다. 언제든지 다시 확인할 수 있습니다.';

  @override
  String get reviewAgain => '개인정보 처리방침 다시 보기';

  @override
  String get osmAttribution => '© OpenStreetMap 기여자';

  @override
  String get back => '뒤로';

  @override
  String get close => '닫기';

  @override
  String get paletteLagoon => '라군';

  @override
  String get paletteIndigo => '인디고';

  @override
  String get paletteForest => '포레스트';

  @override
  String get paletteRose => '로즈';

  @override
  String get paletteAmber => '앰버';

  @override
  String get paletteLavender => '라벤더';

  @override
  String get paletteBrick => '브릭';

  @override
  String get paletteGraphite => '그래파이트';

  @override
  String get unnamedToilet => '공중화장실';

  @override
  String resultCount(int count) {
    return '결과 $count개';
  }

  @override
  String walkMinutes(int minutes) {
    return '도보 $minutes분';
  }

  @override
  String sourceLine(String source) {
    return '출처: $source';
  }
}

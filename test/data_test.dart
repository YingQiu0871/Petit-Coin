import 'package:flutter_test/flutter_test.dart';
import 'package:petit_coin/data/filters.dart';
import 'package:petit_coin/data/opening_hours.dart';
import 'package:petit_coin/data/sync_policy.dart';
import 'package:petit_coin/data/toilet.dart';
import 'package:petit_coin/data/toilet_repository.dart';

const _overpass = '''
{"elements":[
 {"type":"node","id":1,"lat":48.8584,"lon":2.3470,
  "tags":{"amenity":"toilets","name":"Châtelet","fee":"no","wheelchair":"yes","changing_table":"yes","opening_hours":"24/7"}},
 {"type":"way","id":2,"center":{"lat":48.8600,"lon":2.3500},
  "tags":{"amenity":"toilets","fee":"yes","wheelchair":"limited"}},
 {"type":"node","id":3,"lat":48.85,"lon":2.34,"tags":{"amenity":"toilets","access":"private"}},
 {"type":"relation","id":4,"tags":{"amenity":"toilets"}}
]}
''';

void main() {
  group('Overpass parsing', () {
    final toilets = ToiletRepository.parseOverpass(_overpass);

    test('keeps public toilets with a position', () {
      expect(toilets.map((t) => t.id), ['osm:node/1', 'osm:way/2']);
    });

    test('maps tags to fields', () {
      final a = toilets[0];
      expect(a.name, 'Châtelet');
      expect(a.isFree, isTrue);
      expect(a.isAccessible, isTrue);
      expect(a.hasChangingTable, isTrue);
      final b = toilets[1];
      expect(b.fee, isTrue);
      expect(b.wheelchair, Wheelchair.limited);
      expect(b.lat, 48.86);
    });

    test('round-trips through JSON', () {
      final back = Toilet.fromJson(toilets[0].toJson());
      expect(back.toJson(), toilets[0].toJson());
    });
  });

  group('opening hours', () {
    // 2026-10-01 is a Thursday.
    final thu10 = DateTime(2026, 10, 1, 10);
    final thu23 = DateTime(2026, 10, 1, 23);
    final sun10 = DateTime(2026, 10, 4, 10);

    test('24/7 is always open', () {
      expect(openStateAt('24/7', thu23), OpenState.open);
    });

    test('day ranges and times', () {
      const h = 'Mo-Fr 08:00-20:00; Sa,Su 10:00-18:00';
      expect(openStateAt(h, thu10), OpenState.open);
      expect(openStateAt(h, thu23), OpenState.closed);
      expect(openStateAt(h, sun10), OpenState.open);
    });

    test('days not listed are closed', () {
      expect(openStateAt('Mo-Fr 08:00-20:00', sun10), OpenState.closed);
    });

    test('ranges past midnight', () {
      expect(openStateAt('Mo-Su 18:00-02:00', thu23), OpenState.open);
      // Friday 01:00 falls in Thursday's late span.
      expect(
        openStateAt('Th 18:00-02:00', DateTime(2026, 10, 2, 1)),
        OpenState.open,
      );
    });

    test('unsupported syntax is unknown, not guessed', () {
      expect(openStateAt(null, thu10), OpenState.unknown);
      expect(openStateAt('sunrise-sunset', thu10), OpenState.unknown);
      expect(
        openStateAt('Mo-Fr 08:00-20:00; PH off', thu10),
        OpenState.unknown,
      );
    });
  });

  group('filters', () {
    final toilets = ToiletRepository.parseOverpass(_overpass);
    final now = DateTime(2026, 10, 1, 10);

    test('free and accessible narrow the list', () {
      final free = nearestMatching(
        toilets,
        lat: 48.8584,
        lon: 2.347,
        filters: const ToiletFilters(free: true),
        now: now,
      );
      expect(free.map((t) => t.id), ['osm:node/1']);
    });

    test('open now keeps toilets with unknown hours', () {
      final open = nearestMatching(
        toilets,
        lat: 48.8584,
        lon: 2.347,
        filters: const ToiletFilters(openNow: true),
        now: now,
      );
      expect(open, hasLength(2));
    });

    test('sorted nearest first', () {
      final list = nearestMatching(
        toilets,
        lat: 48.8601,
        lon: 2.3501,
        filters: const ToiletFilters(),
        now: now,
      );
      expect(list.first.id, 'osm:way/2');
    });
  });

  test('area is stale after 24 hours', () {
    final now = DateTime(2026, 10, 1, 12);
    expect(SyncPolicy.isStale(null, now), isTrue);
    expect(
      SyncPolicy.isStale(now.subtract(const Duration(hours: 23)), now),
      isFalse,
    );
    expect(
      SyncPolicy.isStale(now.subtract(const Duration(hours: 24)), now),
      isTrue,
    );
  });
}

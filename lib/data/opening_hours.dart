/// Whether a toilet is open at a given moment.
enum OpenState { open, closed, unknown }

const _days = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];

/// Evaluates the common subset of OSM `opening_hours` values:
/// `24/7`, and rules like `Mo-Fr 08:00-20:00; Sa,Su 10:00-18:00`.
/// If any rule uses other syntax (holidays, months, comments) the result
/// is [OpenState.unknown] rather than a guess.
OpenState openStateAt(String? hours, DateTime at) {
  if (hours == null || hours.trim().isEmpty) return OpenState.unknown;
  final value = hours.trim();
  if (value == '24/7') return OpenState.open;

  final rules = <_Rule>[];
  for (final raw in value.split(';')) {
    if (raw.trim().isEmpty) continue;
    final rule = _Rule.parse(raw.trim());
    if (rule == null) return OpenState.unknown;
    rules.add(rule);
  }

  final today = _days[at.weekday - 1];
  final yesterday = _days[(at.weekday + 5) % 7];
  final minutes = at.hour * 60 + at.minute;
  for (final r in rules) {
    for (final (start, end) in r.spans) {
      if (r.covers(today) && minutes >= start && minutes < end) {
        return OpenState.open;
      }
      // The part of yesterday's span that runs past midnight.
      if (end > 24 * 60 && r.covers(yesterday) && minutes < end - 24 * 60) {
        return OpenState.open;
      }
    }
  }
  return OpenState.closed;
}

class _Rule {
  _Rule(this.days, this.spans);

  /// Null means every day.
  final Set<String>? days;
  final List<(int, int)> spans;

  bool covers(String day) => days == null || days!.contains(day);

  static _Rule? parse(String rule) {
    final m = RegExp(r'^((?:[A-Z][a-z](?:-[A-Z][a-z])?,?)+)\s+(.+)$')
        .firstMatch(rule);
    Set<String>? days;
    var times = rule;
    if (m != null) {
      days = _expandDays(m.group(1)!);
      if (days == null) return null;
      times = m.group(2)!;
    } else if (!RegExp(r'^\d').hasMatch(rule)) {
      return null;
    }
    if (times == 'off' || times == 'closed') return _Rule(days, const []);
    final spans = <(int, int)>[];
    for (final span in times.split(',')) {
      final t = RegExp(r'^(\d{1,2}):(\d{2})-(\d{1,2}):(\d{2})$')
          .firstMatch(span.trim());
      if (t == null) return null;
      final start = int.parse(t[1]!) * 60 + int.parse(t[2]!);
      var end = int.parse(t[3]!) * 60 + int.parse(t[4]!);
      if (end <= start) end += 24 * 60;
      spans.add((start, end));
    }
    return _Rule(days, spans);
  }
}

Set<String>? _expandDays(String part) {
  final out = <String>{};
  for (final token in part.split(',')) {
    if (token.isEmpty) continue;
    final range = token.split('-');
    final a = _days.indexOf(range.first);
    final b = range.length == 2 ? _days.indexOf(range.last) : a;
    if (a < 0 || b < 0) return null;
    for (var i = a; ; i = (i + 1) % 7) {
      out.add(_days[i]);
      if (i == b) break;
    }
  }
  return out;
}

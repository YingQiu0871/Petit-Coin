#!/usr/bin/env bash
# Runs inside android-emulator-runner. Installs the app, walks through
# consent with real taps, and saves screenshots for review.
set -euo pipefail
PKG=io.github.yingqiu0871.petit_coin
OUT=${1:-screenshots}
mkdir -p "$OUT"

shot() { adb exec-out screencap -p > "$OUT/$1.png"; echo "saved $OUT/$1.png"; }

# Tap the centre of the first on-screen element whose text or
# content-desc starts with $1. Flutter only exposes its semantics tree
# once an accessibility client (uiautomator) has connected, so the first
# dump can be empty: retry, scrolling down between attempts.
# Slow CI emulators sometimes show "<app> isn't responding" for the
# launcher; that dialog covers our app, so wait it out.
dismiss_anr() {
  grep -q "isn't responding" "$OUT/ui.xml" 2>/dev/null || return 0
  local wait
  wait=$(tr '>' '\n' < "$OUT/ui.xml" | grep -E 'text="Wait"' | head -1 \
    | sed -E 's/.*bounds="\[([0-9]+),([0-9]+)\]\[([0-9]+),([0-9]+)\]".*/\1 \2 \3 \4/' || true)
  echo "system ANR dialog on screen, tapping Wait"
  if [ -n "$wait" ]; then
    read -r x1 y1 x2 y2 <<<"$wait"
    adb shell input tap $(((x1 + x2) / 2)) $(((y1 + y2) / 2))
  else
    adb shell input keyevent KEYCODE_BACK
  fi
}

tap_text() {
  local bounds=""
  for attempt in 1 2 3 4 5 6; do
    adb shell uiautomator dump /sdcard/ui.xml >/dev/null 2>&1 || true
    adb exec-out cat /sdcard/ui.xml > "$OUT/ui.xml" 2>/dev/null || true
    bounds=$(tr '>' '\n' < "$OUT/ui.xml" \
      | grep -E "(text|content-desc)=\"$1" | head -1 \
      | sed -E 's/.*bounds="\[([0-9]+),([0-9]+)\]\[([0-9]+),([0-9]+)\]".*/\1 \2 \3 \4/' || true)
    [ -n "$bounds" ] && break
    echo "attempt $attempt: '$1' not found yet"
    dismiss_anr
    sleep 2
    [ "$attempt" -ge 3 ] && adb shell input swipe 500 1500 500 500 300
  done
  if [ -z "$bounds" ]; then
    echo "no element for '$1'. Visible labels:"
    grep -oE '(text|content-desc)="[^"]+"' "$OUT/ui.xml" | sort -u | head -40 || true
    return 1
  fi
  read -r x1 y1 x2 y2 <<<"$bounds"
  adb shell input tap $(((x1 + x2) / 2)) $(((y1 + y2) / 2))
}

adb install -r build/app/outputs/flutter-apk/app-release.apk
adb shell pm grant "$PKG" android.permission.ACCESS_FINE_LOCATION
adb shell pm grant "$PKG" android.permission.ACCESS_COARSE_LOCATION
adb emu geo fix 2.3470 48.8584

adb logcat -c
adb shell am start -W -n "$PKG/.MainActivity"
sleep 15
shot 1-consent

tap_text "Agree and continue"
sleep 25
shot 2-map

adb shell pidof "$PKG" >/dev/null || { echo "app is not running"; adb logcat -d | tail -200; exit 1; }
# Data comes from a public API that can be busy, so a failed load is
# reported but does not fail the run.
adb logcat -d | grep "Toilet load failed" && echo "::warning::toilet data did not load on the emulator"
if adb logcat -d | grep -E "FATAL EXCEPTION|E/flutter" ; then
  echo "errors in logcat"; exit 1
fi
echo "smoke test passed"

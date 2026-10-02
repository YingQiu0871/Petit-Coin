#!/usr/bin/env bash
# Runs inside android-emulator-runner. Installs the app, walks through
# consent with real taps, and saves screenshots for review.
set -euo pipefail
PKG=me.yingqiu.petitcoin
OUT=${1:-screenshots}
mkdir -p "$OUT"

source "$(dirname "$0")/ui_helpers.sh"

# Keep system "isn't responding" dialogs from covering the app; crashes
# are still caught from logcat below.
adb shell settings put global hide_error_dialogs 1
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

# Record what the nearby list shows, so the data source can be checked
# from the run log without opening screenshots.
adb shell uiautomator dump /sdcard/map.xml >/dev/null 2>&1 || true
adb exec-out cat /sdcard/map.xml > "$OUT/map.xml" 2>/dev/null || true
grep -oE '(text|content-desc)="[^"]*(result|m&#10;|min|Open|Closed|Hours|Free|Paid)[^"]*"' "$OUT/map.xml" \
  | sed -E 's/^(text|content-desc)="//; s/"$//; s/&#10;/ | /g' | head -12 > "$OUT/nearby.txt" || true
echo "nearby list on screen:"; cat "$OUT/nearby.txt"

adb shell pidof "$PKG" >/dev/null || { echo "app is not running"; adb logcat -d | tail -200; exit 1; }
# Data comes from a public API that can be busy, so a failed load is
# reported but does not fail the run.
adb logcat -d | grep "Toilet load failed" && echo "::warning::toilet data did not load on the emulator"
if adb logcat -d | grep -E "FATAL EXCEPTION|E/flutter" ; then
  echo "errors in logcat"; exit 1
fi
echo "smoke test passed"

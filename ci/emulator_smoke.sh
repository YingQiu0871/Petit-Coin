#!/usr/bin/env bash
# Runs inside android-emulator-runner. Installs the app, walks through
# consent with real taps, and saves screenshots for review.
set -euo pipefail
PKG=io.github.yingqiu0871.petit_coin
OUT=${1:-screenshots}
mkdir -p "$OUT"

shot() { adb exec-out screencap -p > "$OUT/$1.png"; echo "saved $OUT/$1.png"; }

# Tap the centre of the first on-screen element whose text matches $1.
tap_text() {
  adb shell uiautomator dump /sdcard/ui.xml >/dev/null
  local bounds
  bounds=$(adb exec-out cat /sdcard/ui.xml | tr '>' '\n' \
    | grep -E "(text|content-desc)=\"$1" | head -1 \
    | sed -E 's/.*bounds="\[([0-9]+),([0-9]+)\]\[([0-9]+),([0-9]+)\]".*/\1 \2 \3 \4/')
  if [ -z "$bounds" ]; then echo "no element for '$1'"; return 1; fi
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
if adb logcat -d | grep -E "FATAL EXCEPTION|E/flutter" ; then
  echo "errors in logcat"; exit 1
fi
echo "smoke test passed"

#!/usr/bin/env bash
# Runs inside android-emulator-runner. Takes Play Store phone screenshots
# in Simplified Chinese with a clean status bar, near Châtelet in Paris.
set -euo pipefail
PKG=me.yingqiu.petitcoin
OUT=${1:-store-screenshots}
mkdir -p "$OUT"

source "$(dirname "$0")/ui_helpers.sh"

wait_for_boot() {
  adb wait-for-device
  until [ "$(adb shell getprop sys.boot_completed 2>/dev/null | tr -d '\r')" = 1 ]; do sleep 2; done
  sleep 10
}

# Switch the whole system to Simplified Chinese; the app follows it.
adb root >/dev/null
sleep 3
adb wait-for-device
adb shell setprop persist.sys.locale zh-Hans-CN
adb shell setprop ctl.restart zygote
wait_for_boot
echo "locale: $(adb shell getprop persist.sys.locale)"

# The launcher is what keeps raising "isn't responding" on slow
# emulators; the app does not need it.
for launcher in com.google.android.apps.nexuslauncher com.android.launcher3; do
  adb shell pm disable-user --user 0 "$launcher" >/dev/null 2>&1 || true
done
adb shell settings put global hide_error_dialogs 1

# Clean status bar: fixed time, full battery and signal, no notifications.
adb shell settings put global sysui_demo_allowed 1
demo() { adb shell am broadcast -a com.android.systemui.demo -e command "$@" >/dev/null; }
demo enter
demo clock -e hhmm 0941
demo battery -e level 100 -e plugged false
demo network -e wifi show -e level 4
demo network -e mobile show -e datatype none -e level 4
demo notifications -e visible false

adb install -r build/app/outputs/flutter-apk/app-release.apk
adb shell pm grant "$PKG" android.permission.ACCESS_FINE_LOCATION
adb shell pm grant "$PKG" android.permission.ACCESS_COARSE_LOCATION
adb emu geo fix 2.3470 48.8584

adb shell am start -W -n "$PKG/.MainActivity"
sleep 15
tap_text "同意并继续"
sleep 30

# Wait until the nearby list shows real results before shooting.
for attempt in $(seq 1 12); do
  dump_ui
  grep -q '个结果' "$OUT/ui.xml" && break
  echo "attempt $attempt: no results yet"
  dismiss_anr
  sleep 5
done
grep -q '个结果' "$OUT/ui.xml" || { echo "::error::toilets did not load"; exit 1; }
sleep 5
clean_shot 1-map

# Open the nearest toilet's details: the first list row, whose label
# includes its opening state.
tap_text '[^"]*(开放中|已关闭|开放时间未知)' || echo "::warning::step failed"
sleep 6
clean_shot 2-detail || echo "::warning::step failed"
# Back would leave the app from the map screen, so use the panel's close button.
tap_text "关闭" || echo "::warning::step failed"
sleep 3

# Filter to free toilets only.
tap_text "免费" || echo "::warning::step failed"
sleep 6
clean_shot 3-filter-free || echo "::warning::step failed"
tap_text "免费" || echo "::warning::step failed"
sleep 3

tap_text "设置" || echo "::warning::step failed"
sleep 4
clean_shot 4-settings || echo "::warning::step failed"
adb shell input keyevent KEYCODE_BACK
sleep 2

adb shell cmd uimode night yes
sleep 8
clean_shot 5-map-dark || echo "::warning::step failed"
adb shell cmd uimode night no

demo exit
ls -l "$OUT"/*.png

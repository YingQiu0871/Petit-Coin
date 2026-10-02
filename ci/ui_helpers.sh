# Shared adb helpers for the emulator scripts. Source after setting OUT.
# shellcheck shell=bash

shot() { adb exec-out screencap -p > "$OUT/$1.png"; echo "saved $OUT/$1.png"; }

dump_ui() {
  adb shell uiautomator dump /sdcard/ui.xml >/dev/null 2>&1 || true
  adb exec-out cat /sdcard/ui.xml > "$OUT/ui.xml" 2>/dev/null || true
}

# Slow CI emulators sometimes show "<app> isn't responding" for the
# launcher; that dialog covers our app, so wait it out. Matches the
# English and Chinese system strings.
ANR_PATTERN="isn't responding|没有响应|无响应"
dismiss_anr() {
  grep -qE "$ANR_PATTERN" "$OUT/ui.xml" 2>/dev/null || return 0
  local wait
  wait=$(tr '>' '\n' < "$OUT/ui.xml" | grep -E 'text="(Wait|等待)"' | head -1 \
    | sed -E 's/.*bounds="\[([0-9]+),([0-9]+)\]\[([0-9]+),([0-9]+)\]".*/\1 \2 \3 \4/' || true)
  echo "system ANR dialog on screen, tapping Wait"
  if [ -n "$wait" ]; then
    read -r x1 y1 x2 y2 <<<"$wait"
    adb shell input tap $(((x1 + x2) / 2)) $(((y1 + y2) / 2))
  else
    adb shell input keyevent KEYCODE_BACK
  fi
}

# Tap the centre of the first on-screen element whose text or
# content-desc starts with $1. Flutter only exposes its semantics tree
# once an accessibility client (uiautomator) has connected, so the first
# dump can be empty: retry, scrolling down between attempts.
tap_text() {
  local bounds=""
  for attempt in 1 2 3 4 5 6; do
    dump_ui
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

# Screenshot for the store: retake until no system dialog covers the app.
clean_shot() {
  for attempt in 1 2 3 4 5; do
    dump_ui
    if ! grep -qE "$ANR_PATTERN" "$OUT/ui.xml"; then
      shot "$1"
      return 0
    fi
    dismiss_anr
    sleep 3
  done
  echo "::error::a system dialog kept covering the app for $1"
  return 1
}

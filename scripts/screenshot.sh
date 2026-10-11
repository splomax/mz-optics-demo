#!/bin/zsh
# Takes headless Chrome screenshots of index.html at desktop and phone width.
# Usage: ./scripts/screenshot.sh [out_dir]   (default: ./screenshots)
# Phone width is shown inside a 390px iframe because headless Chrome won't size a window below ~500px.
set -e
ROOT="${0:A:h:h}"
OUT="${1:-$ROOT/screenshots}"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
mkdir -p "$OUT"
cat > "$OUT/_phone.html" <<HTML
<body style="margin:0;background:#333"><iframe src="file://$ROOT/index.html" style="width:390px;height:3800px;border:0"></iframe></body>
HTML
"$CHROME" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=5000 \
  --window-size=1400,900 --screenshot="$OUT/desktop-hero.png" "file://$ROOT/index.html" 2>/dev/null
"$CHROME" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=5000 \
  --window-size=1400,5200 --screenshot="$OUT/desktop-full.png" "file://$ROOT/index.html" 2>/dev/null
"$CHROME" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=5000 --allow-file-access-from-files \
  --window-size=500,3800 --screenshot="$OUT/phone.png" "file://$OUT/_phone.html" 2>/dev/null
echo "Saved to $OUT"

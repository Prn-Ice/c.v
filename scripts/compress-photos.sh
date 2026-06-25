#!/usr/bin/env bash
#
# compress-photos.sh — web-optimise raw photos for the portfolio gallery.
#
# Reads everything in images_raw/ (JPEG or HEIC) and writes web-ready WebP into
# portfolio/assets/images/photography/:
#   - resized so the long edge is <= 2000px (only shrinks, never upscales)
#   - re-encoded WebP q82 (visually near-lossless, a fraction of the bytes)
#   - EXIF orientation applied, then ALL metadata stripped (removes GPS — these
#     are personal photos going on a public site)
#
# Requires nix (provides ImageMagick with a libheif delegate for HEIC).
# Usage:  bash scripts/compress-photos.sh
set -uo pipefail
cd "$(dirname "$0")/.."

SRC="images_raw"
OUT="portfolio/assets/images/photography"
mkdir -p "$OUT"
rm -f "$OUT/README.md"   # drop the placeholder once real images land

printf "%-40s %10s -> %8s\n" "file" "before" "after"
total_before=0; total_after=0; n=0
for f in "$SRC"/*; do
  [ -f "$f" ] || continue
  base=$(basename "$f"); base="${base%.*}"
  # sanitise: lowercase, non-alnum -> dash
  name=$(printf '%s' "$base" | tr '[:upper:]' '[:lower:]' | tr -c 'a-z0-9' '-' | sed 's/-\{2,\}/-/g; s/^-//; s/-$//')
  dest="$OUT/$name.webp"
  nix shell nixpkgs#imagemagick -c magick "$f" \
    -auto-orient -strip -resize '2000x2000>' -quality 82 -define webp:method=6 \
    "$dest" 2>/dev/null
  b=$(wc -c < "$f"); a=$(wc -c < "$dest" 2>/dev/null || echo 0)
  total_before=$((total_before+b)); total_after=$((total_after+a)); n=$((n+1))
  printf "%-40s %7s KB -> %5s KB\n" "$name.webp" "$((b/1024))" "$((a/1024))"
done
echo "----"
printf "%d images: %s MB -> %s MB\n" "$n" "$((total_before/1048576))" "$((total_after/1048576))"

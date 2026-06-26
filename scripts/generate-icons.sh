#!/usr/bin/env bash
#
# generate-icons.sh — regenerate the portfolio's PWA / home-screen icons from
# the brand mark (orange square + white "P"), replacing Flutter's defaults.
#
# - favicon.svg (rounded) stays the source for the browser tab.
# - The PNG app icons are FULL-BLEED (orange to every edge) so they render
#   correctly as Android adaptive/maskable icons and iOS home-screen icons
#   (no transparent corners). The "P" sits well inside the central safe zone.
#
# Requires nix (provides rsvg-convert via librsvg).
# Usage:  bash scripts/generate-icons.sh
set -euo pipefail
cd "$(dirname "$0")/.."

WEB="portfolio/web"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

# Full-bleed brand mark: orange fills the whole square, white P centered.
cat > "$TMP/icon.svg" <<'SVG'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
  <rect width="32" height="32" fill="#E95420"/>
  <text x="16" y="23" text-anchor="middle"
        font-family="system-ui,-apple-system,'Helvetica Neue',Arial,sans-serif"
        font-weight="700" font-size="20" fill="#fff">P</text>
</svg>
SVG

render() { # size  outfile
  nix shell nixpkgs#librsvg -c rsvg-convert -w "$1" -h "$1" "$TMP/icon.svg" -o "$2"
  echo "  ${1}x${1}  $2"
}

render 48  "$WEB/favicon.png"
render 192 "$WEB/icons/Icon-192.png"
render 512 "$WEB/icons/Icon-512.png"
render 192 "$WEB/icons/Icon-maskable-192.png"
render 512 "$WEB/icons/Icon-maskable-512.png"
echo "Done."

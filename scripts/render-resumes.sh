#!/usr/bin/env bash
#
# render-resumes.sh — rebuild the v3 resume variants from their .md sources.
#
# The resumes live in docs/ (gitignored — they carry full contact PII). Each
# variant is authored as Markdown and rendered to three derived formats:
#
#   <name>.md  ──pandoc──▶  <name>_site_theme.html   (theme CSS embedded inline)
#                          └▶ <name>.docx             (styled via its own reference-doc)
#   <name>_site_theme.html ──Chrome print-to-PDF──▶  <name>_site_theme.pdf
#
# The frontend variant additionally renders a "_vue_theme" HTML + PDF.
#
# Requirements (this machine's setup):
#   - nix          (provides pandoc:  `nix run nixpkgs#pandoc`)
#   - Google Chrome at the standard macOS path (headless print-to-PDF engine,
#     matching the originals' "Producer: Skia/PDF" metadata)
#
# Usage:  bash scripts/render-resumes.sh
#
# See RESUME_PIPELINE.md for the full architecture and rationale.
set -uo pipefail

cd "$(dirname "$0")/.."
DOCS="docs"
SITE_CSS="$DOCS/resume_site_theme.css"
VUE_CSS="$DOCS/resume_vue_theme.css"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
PANDOC=(nix run nixpkgs#pandoc --)
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

# name|title : the <title>/metadata used for each variant's HTML+PDF.
VARIANTS=(
  "resume_v3_first_pass_human_ats|Prince Nna - Senior Full Stack Engineer"
  "resume_v3_second_pass_workflow_ats|Prince Nna - Senior Full Stack Engineer"
  "resume_v3_flutter_mobile_targeted|Prince Nna - Senior Flutter Engineer"
  "resume_v3_frontend_vue_profile|Prince Nna - Senior Frontend Engineer"
)

render_html() { # md css title out
  "${PANDOC[@]}" "$1" -s --embed-resources --css "$2" --metadata title="$3" -o "$4"
  echo "  html  $4"
}

render_docx() { # md out   (preserve existing styling via self-reference-doc)
  local ref="$WORK/$(basename "$2")"
  cp "$2" "$ref" 2>/dev/null || true
  if [ -f "$ref" ]; then
    "${PANDOC[@]}" "$1" --reference-doc="$ref" -o "$2"
  else
    "${PANDOC[@]}" "$1" -o "$2"
  fi
  echo "  docx  $2"
}

# Chrome --headless=new often does NOT exit after writing the PDF; it hangs and
# would block a sequential script. So: launch detached, poll until the output
# file stops growing, then kill it.
render_pdf() { # html out
  local tmp="$WORK/out.pdf"; rm -f "$tmp"
  "$CHROME" --headless=new --disable-gpu --no-pdf-header-footer \
    --user-data-dir="$WORK/prof$RANDOM" \
    --print-to-pdf="$tmp" "file://$PWD/$1" >/dev/null 2>&1 &
  local pid=$! ok="" prev=0 cur
  for _ in $(seq 1 60); do
    if [ -s "$tmp" ]; then
      sleep 0.4; cur=$(wc -c < "$tmp")
      if [ "$cur" = "$prev" ] && [ "$cur" -gt 2000 ]; then ok=1; break; fi
      prev=$cur
    fi
    sleep 0.4
  done
  kill "$pid" 2>/dev/null; wait "$pid" 2>/dev/null
  if [ -n "$ok" ]; then mv "$tmp" "$2"; echo "  pdf   $2"; else echo "  FAIL  $2 (kept previous)"; fi
}

for entry in "${VARIANTS[@]}"; do
  name="${entry%%|*}"; title="${entry#*|}"
  md="$DOCS/$name.md"
  [ -f "$md" ] || { echo "skip $name (no $md)"; continue; }
  echo "$name"
  render_html "$md" "$SITE_CSS" "$title" "$DOCS/${name}_site_theme.html"
  render_pdf  "$DOCS/${name}_site_theme.html" "$DOCS/${name}_site_theme.pdf"
  render_docx "$md" "$DOCS/$name.docx"
  # frontend variant also ships a vue-themed HTML + PDF
  if [ "$name" = "resume_v3_frontend_vue_profile" ]; then
    render_html "$md" "$VUE_CSS" "$title" "$DOCS/${name}_vue_theme.html"
    render_pdf  "$DOCS/${name}_vue_theme.html" "$DOCS/${name}_vue_theme.pdf"
  fi
done

echo "Done."

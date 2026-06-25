# Resume & Portfolio Pipeline

How the résumé and portfolio content in this repo is structured, edited, and
regenerated. There is **no magic CLI** — content lives in plain sources and is
rendered with `pandoc` + headless Chrome.

## Two content systems

### 1. Portfolio site data — `shared/lib/data/*.dart`  (tracked, public)

Structured Dart data consumed by both portfolio apps (`portfolio/` Flutter WASM
and `portfolio_jaspr/` Jaspr SSG). This is the source of truth for the live
portfolio site.

| File | Holds |
| --- | --- |
| `bio.dart` | About-me narrative paragraphs |
| `case_studies.dart` | Project case studies (`role`, `dateRange`, `liveUrl`, sections) |
| `skills.dart`, `site_config.dart`, `social_links.dart`, `interests.dart` | Skills, hero/SEO config, links, interests |

Work history is expressed through case studies (each carries a `role` +
`dateRange`), not a separate "positions" list.

### 2. Résumé variants — `docs/resume_v3_*`  (gitignored — local only)

Four role-targeted résumés, each authored as Markdown and rendered to themed
HTML / PDF / DOCX:

| Variant | Target |
| --- | --- |
| `resume_v3_first_pass_human_ats` | Full-stack (human + ATS, first pass) |
| `resume_v3_second_pass_workflow_ats` | Full-stack (ATS, refined) |
| `resume_v3_flutter_mobile_targeted` | Flutter / mobile roles |
| `resume_v3_frontend_vue_profile` | Frontend / Vue roles |

`docs/` is **gitignored**: these résumés carry full contact PII (phone number,
city) that the public résumés (`resume_v2_ats_optimized.md`, `index.html`)
deliberately omit. They are rebuilt locally, never committed.

## Render pipeline

```
docs/<name>.md ──pandoc──▶ docs/<name>_site_theme.html   (theme CSS inlined)
                          └▶ docs/<name>.docx              (styled reference-doc)
docs/<name>_site_theme.html ──Chrome print-to-PDF──▶ docs/<name>_site_theme.pdf
```

- **HTML** — `pandoc -s --embed-resources --css docs/resume_site_theme.css
  --metadata title="…"`. `--embed-resources` inlines the theme CSS so the file
  is self-contained. The frontend variant also renders a `_vue_theme` HTML using
  `docs/resume_vue_theme.css`.
- **PDF** — printed from the themed HTML by **headless Google Chrome**
  (`--headless=new --print-to-pdf`), the same engine that produced the originals
  (their metadata reads `Producer: Skia/PDF`, `Creator: Chrome`). Gotcha:
  `--headless=new` often doesn't exit after writing the PDF, so the script polls
  for the file to stabilise and then kills Chrome.
- **DOCX** — `pandoc` using each file's **own existing `.docx` as the
  `--reference-doc`**, preserving its styling (two variants embed custom fonts
  ≈700 KB; two use pandoc defaults ≈15 KB).

### Rebuild everything

```bash
bash scripts/render-resumes.sh   # requires nix (pandoc) + Google Chrome
```

Inspect a rendered PDF's text with:

```bash
nix shell nixpkgs#poppler-utils -c pdftotext docs/<name>_site_theme.pdf -
```

## Editing checklist

1. Edit the source: `docs/<variant>.md` (résumés) and/or
   `shared/lib/data/*.dart` (portfolio). These are the only hand-edited files.
2. Run `scripts/render-resumes.sh` to regenerate HTML/PDF/DOCX.
3. Commit only the tracked, PII-free changes (`shared/lib/data/*`, this doc, the
   script). The `docs/` outputs stay local by design.

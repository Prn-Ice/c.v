# Resume & Portfolio Pipeline

Edit CVs and cover letters in Markdown, then render them with Pandoc and
headless Chrome. Both portfolio apps read their shared copy from Dart files.

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

### 2. Résumé variants — `docs/resume_v*` (gitignored — local only)

The current general-purpose CVs are `resume_v4_full_stack` and
`resume_v4_flutter_mobile`, revised on 9 November 2026 using the required
[writing skill](.agents/skills/writing-clearly-and-concisely/SKILL.md).
The v3 variants remain available for historical and role-specific use.
Each Markdown source renders to HTML, PDF, and DOCX:

| Variant | Target |
| --- | --- |
| `resume_v4_full_stack` | Current full-stack CV |
| `resume_v4_flutter_mobile` | Current Flutter / mobile CV |
| `resume_v3_first_pass_human_ats` | Full-stack (human + ATS, first pass) |
| `resume_v3_second_pass_workflow_ats` | Full-stack (ATS, refined) |
| `resume_v3_flutter_mobile_targeted` | Flutter / mobile roles |
| `resume_v3_frontend_vue_profile` | Frontend / Vue roles |
| `resume_v3_genki_mid_backend` | Genki mid-level backend role (full-stack identity, backend-relevant evidence) |

`docs/` is **gitignored**: these résumés carry private contact details
(phone number and city) that the portfolio sites omit. They are
rebuilt locally, never committed.

> The earlier `resume_v2_ats_optimized.md` has been retired to `archive/`
> (gitignored) and is no longer the published résumé.

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
- **Current CV theme** — v4 uses `docs/resume_v4_theme.css`, with larger type,
  wider print margins, and a page break before Keller Williams. Earlier CV
  themes remain unchanged.
- **Genki theme** — the Genki variant uses `docs/resume_genki_theme.css` as its
  primary theme and renders `_genki_theme.html` / `_genki_theme.pdf` outputs.
  Its content remains single-column and ATS-safe; the separate theme only
  changes visual hierarchy and colour.
- **PDF** — printed from the themed HTML by **headless Google Chrome**
  (`--headless=new --print-to-pdf`), the same engine that produced the originals
  (their metadata reads `Producer: Skia/PDF`, `Creator: Chrome`). Gotcha:
  `--headless=new` often doesn't exit after writing the PDF, so the script polls
  for the file to stabilise and then kills Chrome.
- **DOCX** — `pandoc` using each file's **own existing `.docx` as the
  `--reference-doc`**, preserving its styling (two variants embed custom fonts
  ≈700 KB; two use pandoc defaults ≈15 KB). On their first render, the v4
  variants use the corresponding v3 DOCX as their style reference.

### Rebuild everything

```bash
bash scripts/render-resumes.sh   # requires nix (pandoc) + Google Chrome
```

To render only the current CVs:

```bash
bash scripts/render-resumes.sh resume_v4_full_stack resume_v4_flutter_mobile
```

## Cover letters

The current general mobile letter is
`cover_letters/2026-11-09-flutter-mobile-engineer-general.md`.
Older letters remain unchanged. Render the new letter with the existing local
renderer:

```bash
python3 scripts/render-cover-letters.py cover_letters/2026-11-09-flutter-mobile-engineer-general.md
```

The renderer reads letter metadata and body paragraphs from Markdown, then uses
headless Chrome to write a PDF beside the source. Both stay local; neither is
part of the site deployment.

Inspect a rendered PDF's text with:

```bash
nix shell nixpkgs#poppler-utils -c pdftotext docs/<name>_site_theme.pdf -
```

## Editing checklist

1. Read the writing skill and Prince's voice samples.
2. Edit Markdown sources in `docs/` or `cover_letters/`, shared portfolio data
   in `shared/lib/data/`, or page-specific copy in the relevant app.
3. Run the appropriate renderer to regenerate application files. Check PDF
   text, page breaks, and layout; run site analysis, tests, and builds.
4. Commit only public sources and workflow files. Keep `docs/`, cover letters,
   and unrelated local changes out of the deployment commit.

## Site deployment

GitHub Pages must use **GitHub Actions** as its publishing source
(`build_type: workflow`), not the `main` branch's root directory. Branch
publishing serves the historical `index.html` instead of the built portfolio.
Keep the custom domain `portfolio.prnice.me` and HTTPS enforcement enabled.

The workflow builds Flutter at `/` and Jaspr at `/jaspr/`. After deployment,
check both public URLs for the new copy and confirm that the About page still
contains the handwritten bio verbatim. A successful Actions run alone does not
prove that the correct site is being served.

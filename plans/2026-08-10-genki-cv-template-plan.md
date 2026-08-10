# Genki CV Template Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create and verify a two-page, Genki-targeted CV that preserves Prince's full-stack identity while foregrounding truthful backend-relevant evidence.

**Architecture:** Add one private Markdown résumé source and one private Genki theme under the existing gitignored `docs/` directory. Register the variant in the tracked Pandoc/Chrome render script, preserve every existing output, and verify the PDF, DOCX, and extracted text separately.

**Tech Stack:** Markdown, CSS, Bash, Pandoc, headless Chrome, Poppler, DOCX/OOXML rendering

---

## File map

- Create `docs/resume_v3_genki_mid_backend.md`: private source of truth.
- Create `docs/resume_genki_theme.css`: private ATS-safe teal/green theme.
- Modify `scripts/render-resumes.sh`: register the fifth variant and select its theme.
- Modify `RESUME_PIPELINE.md`: document the variant and output naming.
- Generate `docs/resume_v3_genki_mid_backend_genki_theme.html`.
- Generate `docs/resume_v3_genki_mid_backend_genki_theme.pdf`.
- Generate `docs/resume_v3_genki_mid_backend.docx`.

### Task 1: Author the Genki-targeted résumé source

**Files:**
- Create: `docs/resume_v3_genki_mid_backend.md`
- Reference: `docs/resume_v3_second_pass_workflow_ats.md`
- Reference: `docs/career_context_v2.md`
- Reference: `plans/2026-08-10-genki-cv-template-design.md`

- [ ] **Step 1: Verify the new source is absent**

Run:

```bash
test ! -e docs/resume_v3_genki_mid_backend.md
```

Expected: exit code `0` with no output.

- [ ] **Step 2: Create the header and summary**

Use this exact header hierarchy:

```markdown
# Prince Nna

Full-Stack Software Engineer

Dart · TypeScript · Production APIs · GraphQL · PostgreSQL

stormprince77@gmail.com | +234 808-384-2346 | Lagos, Nigeria / Remote

portfolio.prnice.me | github.com/Prn-Ice | linkedin.com/in/princenna

## Summary

Full-stack software engineer with 6+ years of experience shipping production systems across mobile, web, APIs, and data infrastructure. Most recently founded and built findaphone.ng end to end, including its Dart API, PostgreSQL data model, ingestion and enrichment pipelines, recommendation engine, testing strategy, and production deployment. Experienced in complex product domains, typed asynchronous programming, GraphQL, and AI-agentic development, with a track record of learning unfamiliar systems quickly and turning them into maintainable software.
```

- [ ] **Step 3: Add compact, truthful technical skills**

Add `## Technical Skills` with these five exact categories:

```markdown
Languages: Dart, TypeScript, JavaScript, SQL, HTML, CSS, Nix

Backend and Data: Dart Frog, REST APIs, GraphQL, PostgreSQL, Supabase, row-level security, schema design, data ingestion, web scraping, validation pipelines

Frontend and Mobile: Flutter, React, Jaspr, Next.js, Handlebars, Bloc, Riverpod, Zustand, React Query

Quality and Delivery: Unit testing, integration testing, schema-contract testing, end-to-end testing, Docker, GitHub Actions, Codemagic, CI/CD, Railway, Cloudflare Pages

Architecture and Practice: Modular monorepos, pure domain logic, repository pattern, asynchronous programming, developer documentation, AI-assisted and agentic development
```

- [ ] **Step 4: Add experience with full-stack identity and backend relevance**

Add `## Experience` in reverse chronological order. Reuse only verified facts from `docs/resume_v3_second_pass_workflow_ats.md` and `docs/career_context_v2.md`:

- `findaphone.ng — Founder and Full-Stack Engineer`, April 2026–Present: five bullets covering the complete Dart monorepo, Dart Frog API and PostgreSQL, confidence-scored catalogue review, four idempotent enrichment pipelines and price-sanity validation, eight-category recommendation logic across five entry paths, sub-millisecond in-memory operations, Railway/Cloudflare/Supabase deployment, and layered tests.
- `Keller Williams Realty International — Senior Mobile and Web Developer`, March 2023–May 2026: six bullets covering 99 release tags, cross-platform search ownership, Search 2.0 with React/TypeScript/GraphQL, REST-to-GraphQL and schema-governance work, the NestJS profile-service validation contribution, the 75-second-to-under-3-second test improvement, and 7 authored/36 contributed documentation pages.
- `Chigisoft — Lead Mobile Developer`, January 2021–2023: four bullets covering architecture leadership, complex fintech/crypto/real-estate domains, API/authentication/payments/KYC integration, and repeatable delivery systems.
- `Chigisoft — Mobile Developer and Intern`, May 2019–December 2020: one compressed bullet retaining Flutter, production API integration, Dart, Git, Linux, SOLID, and early backend experimentation.

Every bullet must answer at least one of: system owned, complexity handled, quality improved, or delivery enabled. Keep Flutter and React explicit; do not rename any role.

- [ ] **Step 5: Add selected systems and education**

Add `## Selected Systems and Open Source` with three concise entries:

- `medusa-docker`: PostgreSQL, Redis, admin, storefront, 32 stars, 16 forks.
- `Skyewallet`: production crypto flows, KYC, secure authentication, Retrofit, mTLS, 90+ builds.
- `Developer Tooling and Systems`: 8 Mason templates, Nix Flakes/Home Manager, and ecosystem contributions.

End with:

```markdown
## Education

Bells University of Technology — Bachelor of Technology, Computer Science

Ota, Ogun State, Nigeria | 2016 – 2020
```

- [ ] **Step 6: Verify truthful positioning**

Run:

```bash
rg -n -i "ATS Keywords|Kotlin|coroutines|event sourcing|Stripe|Heroku|backend-focused" docs/resume_v3_genki_mid_backend.md
```

Expected: exit code `1` with no matches.

Run:

```bash
rg -n "Full-Stack Software Engineer|Dart Frog|GraphQL|PostgreSQL|AI-agentic development|Flutter|React" docs/resume_v3_genki_mid_backend.md
```

Expected: all required positioning terms appear; Flutter and React remain visible.

### Task 2: Create the ATS-safe Genki theme

**Files:**
- Create: `docs/resume_genki_theme.css`
- Reference: `docs/resume_site_theme.css`

- [ ] **Step 1: Verify the new theme is absent**

Run:

```bash
test ! -e docs/resume_genki_theme.css
```

Expected: exit code `0` with no output.

- [ ] **Step 2: Create a single-column A4 theme**

Build the theme from the existing selector structure with these exact design tokens and print constraints:

```css
:root {
  --accent: #087f78;
  --accent-dark: #075e59;
  --accent-soft: #eaf7f4;
  --ink: #172124;
  --muted: #566267;
  --line: #d7e4e1;
  --paper: #ffffff;
}

@page {
  size: A4;
  margin: 10mm 11mm;
}

html {
  font-size: 11.5px;
}

body {
  width: 860px;
  max-width: calc(100vw - 68px);
  margin: 34px auto;
  padding: 27px 36px 28px 39px;
  color: var(--ink);
  background: var(--paper);
  font-family: "Plus Jakarta Sans", "Aptos", "Segoe UI", system-ui, sans-serif;
  line-height: 1.34;
}
```

Retain the existing theme's semantic selectors for `h1`, `h2`, `h3`, paragraphs, lists, markers, strong text, and links. Style the first four paragraphs after `h1` as title, technical line, contact line, and links. Use circular teal section markers, a teal top border on screen, and no decorative content in the document text.

Add this exact print foundation and keep print body text at or above `10.5px`:

```css
@media print {
  html {
    font-size: 10.8px;
  }

  body {
    width: auto;
    max-width: none;
    margin: 0;
    padding: 0;
    box-shadow: none;
  }

  h2,
  h3 {
    break-after: avoid;
  }

  li {
    break-inside: avoid;
  }
}
```

- [ ] **Step 3: Verify the theme stays parseable**

Run:

```bash
rg -n "@page|size: A4|@media print|break-after: avoid|break-inside: avoid|font-family" docs/resume_genki_theme.css
rg -n -i "grid|column-count|position: absolute" docs/resume_genki_theme.css
```

Expected: all print controls match; the second search exits `1` with no multi-column or absolute-positioning rules.

### Task 3: Register the fifth render variant

**Files:**
- Modify: `scripts/render-resumes.sh:24-90`
- Modify: `RESUME_PIPELINE.md:24-74`

- [ ] **Step 1: Verify registration is initially absent**

Run:

```bash
rg -n "resume_v3_genki_mid_backend|resume_genki_theme" scripts/render-resumes.sh RESUME_PIPELINE.md
```

Expected: exit code `1`.

- [ ] **Step 2: Add the theme constant and variant**

After `VUE_CSS`, add:

```bash
GENKI_CSS="$DOCS/resume_genki_theme.css"
```

Append this item to `VARIANTS`:

```bash
"resume_v3_genki_mid_backend|Prince Nna - Full-Stack Software Engineer"
```

- [ ] **Step 3: Select the primary output theme per variant**

Replace the three unconditional primary render calls inside the loop with:

```bash
  primary_css="$SITE_CSS"
  primary_theme="site_theme"
  if [ "$name" = "resume_v3_genki_mid_backend" ]; then
    primary_css="$GENKI_CSS"
    primary_theme="genki_theme"
  fi

  render_html "$md" "$primary_css" "$title" "$DOCS/${name}_${primary_theme}.html"
  render_pdf  "$DOCS/${name}_${primary_theme}.html" "$DOCS/${name}_${primary_theme}.pdf"
  render_docx "$md" "$DOCS/$name.docx"
```

Leave the existing Vue secondary-theme block unchanged.

- [ ] **Step 4: Document the variant**

Change “Four role-targeted résumés” to “Five role-targeted résumés” in `RESUME_PIPELINE.md`, add this table row:

```markdown
| `resume_v3_genki_mid_backend` | Genki mid-level backend role (full-stack identity, backend-relevant evidence) |
```

Document that `docs/resume_genki_theme.css` produces `_genki_theme.html` and `_genki_theme.pdf` while keeping the content single-column and ATS-safe.

- [ ] **Step 5: Verify and commit the tracked pipeline slice**

Run:

```bash
bash -n scripts/render-resumes.sh
git diff --check
git diff -- scripts/render-resumes.sh RESUME_PIPELINE.md
```

Expected: no shell or whitespace errors; only the fifth variant, theme routing, and pipeline documentation are changed.

Commit:

```bash
git add scripts/render-resumes.sh RESUME_PIPELINE.md
git commit -m "feat: add Genki resume render variant"
```

### Task 4: Render and structurally verify the artifacts

**Files:**
- Generate: `docs/resume_v3_genki_mid_backend_genki_theme.html`
- Generate: `docs/resume_v3_genki_mid_backend_genki_theme.pdf`
- Generate: `docs/resume_v3_genki_mid_backend.docx`

- [ ] **Step 1: Load the required artifact skills**

Read and follow the complete `documents:documents` and `pdf:pdf` skills before generating or validating the DOCX and PDF.

- [ ] **Step 2: Render all variants**

Run:

```bash
bash scripts/render-resumes.sh
```

Expected: successful HTML, PDF, and DOCX lines for `resume_v3_genki_mid_backend`, followed by `Done.`.

- [ ] **Step 3: Confirm all Genki artifacts are non-empty**

Run each command:

```bash
test -s docs/resume_v3_genki_mid_backend_genki_theme.html
test -s docs/resume_v3_genki_mid_backend_genki_theme.pdf
test -s docs/resume_v3_genki_mid_backend.docx
```

Expected: exit code `0` from each command.

- [ ] **Step 4: Verify A4 and exactly two PDF pages**

Run:

```bash
nix shell nixpkgs#poppler-utils -c pdfinfo docs/resume_v3_genki_mid_backend_genki_theme.pdf
```

Expected: `Pages: 2` and A4 page dimensions.

- [ ] **Step 5: Verify ATS-readable text and order**

Run:

```bash
nix shell nixpkgs#poppler-utils -c pdftotext -layout docs/resume_v3_genki_mid_backend_genki_theme.pdf /tmp/genki-cv.txt
rg -n "Prince Nna|Full-Stack Software Engineer|SUMMARY|TECHNICAL SKILLS|EXPERIENCE|SELECTED SYSTEMS AND OPEN SOURCE|EDUCATION" /tmp/genki-cv.txt
rg -n -i "ATS Keywords|Kotlin|coroutines|event sourcing|Stripe|Heroku|backend-focused" /tmp/genki-cv.txt
```

Expected: all headings appear once in source order; the prohibited-keyword search exits `1`.

### Task 5: Complete visual QA and iterate

**Files:**
- Verify: `docs/resume_v3_genki_mid_backend_genki_theme.pdf`
- Verify: `docs/resume_v3_genki_mid_backend.docx`
- Modify only after a rendered defect: `docs/resume_genki_theme.css`
- Modify only after copy overflow: `docs/resume_v3_genki_mid_backend.md`

- [ ] **Step 1: Rasterize and inspect both PDF pages**

Run:

```bash
mkdir -p /tmp/genki-cv-pdf
nix shell nixpkgs#poppler-utils -c pdftoppm -png -r 150 docs/resume_v3_genki_mid_backend_genki_theme.pdf /tmp/genki-cv-pdf/page
```

Open both PNGs. Verify compact header hierarchy, readable contact lines, restrained accent use, no stranded headings, no clipping, balanced page fill, visible Flutter/React evidence, and backend-relevant evidence within the first half-page.

- [ ] **Step 2: Render and inspect the DOCX**

Run:

```bash
python3 /Users/prnice/.codex/plugins/cache/openai-primary-runtime/documents/26.805.11740/skills/documents/render_docx.py docs/resume_v3_genki_mid_backend.docx --output_dir /tmp/genki-cv-docx --emit_pdf
```

Open every `/tmp/genki-cv-docx/page-*.png`. Verify every paragraph and bullet is present, headings are distinct, links are readable, and no content overlaps or clips. DOCX pagination may differ from the primary PDF, but the file must remain clean and editable.

- [ ] **Step 3: Correct the owning source and repeat verification**

For global overflow, adjust only A4 margins or print font size in `docs/resume_genki_theme.css`, never below `9mm` margins or `10.5px` body text. For an isolated wrap or stranded heading, shorten only that bullet in `docs/resume_v3_genki_mid_backend.md`. Repeat Tasks 4.2–5.2 after every correction.

### Task 6: Final verification and handoff

**Files:**
- Verify: all seven files listed in the file map

- [ ] **Step 1: Run final checks**

Run:

```bash
bash -n scripts/render-resumes.sh
git diff --check
rg -n -i "ATS Keywords|Kotlin|coroutines|event sourcing|Stripe|Heroku|backend-focused" docs/resume_v3_genki_mid_backend.md
git check-ignore -v docs/resume_v3_genki_mid_backend.md docs/resume_genki_theme.css docs/resume_v3_genki_mid_backend_genki_theme.html docs/resume_v3_genki_mid_backend_genki_theme.pdf docs/resume_v3_genki_mid_backend.docx
```

Expected: shell and whitespace checks pass; the prohibited-keyword search exits `1`; every private artifact reports the `docs/` ignore rule.

- [ ] **Step 2: Confirm privacy and tracked scope**

Run:

```bash
git status --short
git diff --cached --check
```

Expected: no private résumé or contact PII is staged; tracked changes are limited to the render pipeline and its documentation.

- [ ] **Step 3: Hand off the deliverables**

Provide clickable paths to the Markdown, PDF, DOCX, and HTML. State that the CV preserves the full-stack identity, retains frontend/mobile evidence, foregrounds backend-relevant accomplishments, makes no Kotlin claim, and omits the standalone ATS section.

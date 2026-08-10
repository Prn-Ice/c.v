# Genki and Mobile Cover Letter Pair — Design

**Date:** 2026-08-10
**Status:** Approved

## Objective

Replace the current generic three-page cover letter with two concise, one-page application letters that preserve Prince's warmth, directness, and care for users:

1. a tailored letter for Genki's Mid-Level Backend Developer role; and
2. a reusable letter for broad mid-to-senior Flutter/mobile roles.

## Voice to preserve

- Open conversationally instead of using stiff application language.
- Retain the belief that customers should feel cared for through the software they use.
- Express curiosity, growth, readable code, and respect for fellow developers in plain language.
- Sound confident without pretending to have experience Prince does not have.

## Editorial approach

Use the approved **voice-first with proof** direction. Each letter begins with a human reason for applying, supports it with two or three verified examples, and closes with a specific statement of contribution. Metrics are used selectively rather than stacked into résumé-like prose.

### Genki letter

Present Prince as a product-minded full-stack engineer intentionally moving deeper into backend systems—not as an established Kotlin specialist. Connect verified experience with Dart services, REST and GraphQL APIs, PostgreSQL, data pipelines, testing, startup ambiguity, and AI-agentic development to Genki's Kotlin, event-sourced backend. State the Kotlin gap plainly and frame language acquisition as a concrete ramp-up, not a claim of equivalence.

### Mobile letter

Lead with six years of Flutter/Dart experience and end-to-end product ownership. Keep web and backend experience as an advantage because it improves API collaboration, architecture decisions, debugging across boundaries, and the ability to ship complete customer experiences. Keep the target broad enough for both mid-level and senior roles.

## Content constraints

- 220–260 words per letter, excluding the contact header and addressee.
- No ATS keyword section.
- No naked URLs inside the body.
- No claim of Kotlin production experience, backend specialization, staff-level scope, or unverified impact.
- Do not describe AI as a substitute for engineering judgment. Present it as an accelerator whose output is verified through tests, code review, and system understanding.
- Preserve first-person phrasing and natural sentence rhythm; avoid generic phrases such as "I am writing to express my interest."

## Visual system

- Output both editable DOCX and application-ready PDF files.
- US Letter portrait, one page, one-inch margins.
- Use the `narrative_proposal` document preset with a named `cover_letter` override: left-aligned body text, Calibri 11 pt, 1.15 line spacing, 8 pt paragraph spacing.
- Adapt the `customer_pack` header pattern into a restrained personal masthead: Prince's name, professional descriptor, contact links, and a thin muted divider. No running header or page number on a one-page letter.
- Use a restrained deep-navy accent for the name and addressee; body text remains near-black.
- Keep links in the contact header only and ensure displayed labels are short.

## Verification

- Render every DOCX to PNG and PDF.
- Confirm exactly one page per letter, readable type, clean spacing, working hyperlinks, no overflow, and no blank pages.
- Extract final PDF text and confirm names, target roles, links, and paragraph order.
- Run an OOXML/preset audit for page geometry, typography, styles, and metadata hygiene.


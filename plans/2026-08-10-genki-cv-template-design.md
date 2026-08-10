# Genki Mid-Level Backend Developer CV Design

## Goal

Create a Genki-specific CV variant that makes Prince's relevant backend evidence
easy to find without misrepresenting him as a backend specialist or claiming
Kotlin experience he does not have.

The CV will preserve his full-stack identity and use his breadth as evidence of
system ownership: he understands production software from data and APIs through
the web and mobile clients that consume them.

## Positioning

Use the title **Full-Stack Software Engineer**, supported by a compact technical
line such as **Dart · TypeScript · Production APIs · GraphQL · PostgreSQL**.

The summary will establish three points:

1. Six-plus years shipping production software across mobile, web, APIs, and
   data infrastructure.
2. Recent end-to-end ownership of findaphone.ng, including its Dart API,
   PostgreSQL model, pipelines, recommendation logic, testing, and deployment.
3. Transferable experience in typed asynchronous programming, complex product
   domains, GraphQL, and AI-assisted development.

The summary must not call Prince a Kotlin developer, backend-focused engineer,
or event-sourcing practitioner.

## Information Architecture

The CV will use a two-page, single-column, ATS-safe layout in this order:

1. Name, full-stack title, technical line, and contact links
2. Summary
3. Technical skills, ordered by relevance to the role
4. Experience
5. Selected systems and open-source work
6. Education

There will be no standalone **ATS Keywords** section. Relevant terms will appear
naturally in the summary, skills, and evidence bullets.

## Experience Emphasis

### findaphone.ng

Lead with end-to-end product ownership, then emphasize the Dart Frog API,
Supabase PostgreSQL data model, idempotent ingestion and enrichment pipelines,
pure recommendation logic, validation workflows, automated tests, and Railway
deployment. Preserve the web/client side of the system so the entry remains an
honest full-stack account.

### Keller Williams Realty International

Retain the substantial Flutter and React experience. Select evidence that also
demonstrates value for Genki: working in a complex real-estate domain, GraphQL
migration and governance, integration testing, backend-service contributions,
production delivery, architecture documentation, and cross-platform ownership.

### Chigisoft

Compress earlier roles while retaining leadership, fintech domain complexity,
API integration, authentication, payments, testing, modular architecture, and
delivery systems. Avoid allowing mobile framework details to crowd out more
transferable engineering evidence.

## Skills Strategy

Use compact, truthful categories:

- Languages: Dart, TypeScript, JavaScript
- Backend and Data: Dart Frog, REST APIs, GraphQL, PostgreSQL, Supabase,
  ingestion pipelines, data validation
- Frontend and Mobile: Flutter, React, Jaspr, state management
- Quality and Delivery: unit, integration, schema-contract, and end-to-end
  testing; Docker; CI/CD; Railway; Cloudflare
- Architecture and Practice: modular architecture, pure domain logic,
  asynchronous programming, documentation, AI-assisted development

Do not list Kotlin, coroutines, event sourcing, Stripe, or Heroku as skills.
Conceptual similarities may be discussed in an application note or interview,
not presented as prior experience.

## Visual Design

Reuse the existing ATS-safe single-column rendering pipeline, but give this
variant a distinct Genki-appropriate theme through restrained teal/green accents.
Typography, hierarchy, link treatment, and page breaks must remain readable when
printed to A4 and when parsed as plain text. Decorative elements must not carry
meaning or interfere with selection and extraction.

## Acceptance Criteria

- The first half-page establishes a truthful full-stack identity and makes the
  backend-relevant evidence immediately visible.
- Frontend and mobile experience remain substantive parts of the CV.
- No skill or claim implies prior Kotlin, coroutine, or event-sourcing work.
- The standalone ATS keyword block is removed.
- The Markdown source renders successfully to HTML, PDF, and DOCX.
- The PDF is two pages, visually balanced, selectable, and text-extractable.
- Extracted text preserves section order and all essential contact information.
- The new variant does not alter the content of existing résumé variants.

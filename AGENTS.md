# CV and portfolio working agreement

## Writing standard — required for every task

- **Use [Writing Clearly and Concisely](.agents/skills/writing-clearly-and-concisely/SKILL.md) for all prose.** Read the skill and its guide before writing, editing, or reviewing text for people, including agent messages, CVs, cover letters, site copy, documentation, comments, test descriptions, and commit or PR text.
- **One prose-style authority.** The writing skill takes precedence over style advice in other guides, skills, plans, and examples. Preserve facts, terminology, accessibility, behavior, and approved decisions from those sources.
- **Preserve meaning and Prince's voice.** Read the skill's [confirmed samples](.agents/skills/writing-clearly-and-concisely/references/prince-voice.md) when writing in his voice. Keep the directness and personality; do not invent anecdotes, achievements, metrics, or qualifications.
- **Highlight violations you encounter.** Give the location, a short excerpt, the problem, and a revision. Correct safe in-scope problems and report the change. Discuss wider changes and record unresolved findings through the project's existing workflow; if no tracker is available, include them in the handoff.
- **Respect source ownership.** Preserve exact quotations and confirmed voice samples. Edit source content and regenerate outputs through the normal pipeline.
- **The bio stays handwritten.** Do not rewrite, polish, or apply the writing skill to the biography or site credits in `shared/lib/data/bio.dart`. Preserve them verbatim unless Prince explicitly asks to change that section. General requests to improve site copy do not include the bio.

## Sources and privacy

- `shared/lib/data/` supplies both portfolio sites. Page-specific copy lives in `portfolio/lib/` and `portfolio_jaspr/lib/`.
- Read `RESUME_PIPELINE.md` before changing or generating application documents.
- CVs in `docs/` and letters in `cover_letters/` stay local. They contain private contact details. Never force-add them or copy those details into public site content.
- Create new application versions without overwriting historical applications unless asked.
- Preserve unrelated changes. Stage only this task's files when a deployment requires a commit.

## Verification and deployment

- Check Dart analysis, tests, and both site builds after site changes. Do not change dependencies for prose edits.
- Inspect generated PDFs for readable text, page breaks, and clipping.
- `.github/workflows/deploy.yml` deploys both sites to GitHub Pages when `main` is pushed. Commit, push, or deploy only with current user approval. Verify the workflow and public pages before reporting a deployment as complete.

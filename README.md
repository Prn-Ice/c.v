# Prince Nna — CV and portfolio

I'm a full-stack engineer building Flutter apps, Dart/Jaspr websites, React
interfaces, and developer tools. I lead mobile development at Expert Listing,
previously worked on search at Keller Williams, and founded
[findaphone.ng](https://findaphone.ng).

- [Portfolio](https://portfolio.prnice.me) — Flutter web
- [Text-first portfolio](https://portfolio.prnice.me/jaspr/) — Jaspr
- [GitHub](https://github.com/Prn-Ice)
- [Email](mailto:princenna@proton.me)

## Repository layout

| Path | Purpose |
| --- | --- |
| `shared/lib/data/` | Biography, projects, skills, and copy shared by both sites |
| `portfolio/` | Flutter web app |
| `portfolio_jaspr/` | Statically generated Jaspr site |
| `docs/` | Private CV sources and generated files; gitignored |
| `cover_letters/` | Private cover letters and PDFs; gitignored |
| `scripts/` | Document rendering and asset tools |

## Editing and publishing

Use [Writing Clearly and Concisely](.agents/skills/writing-clearly-and-concisely/SKILL.md)
for all prose. [AGENTS.md](AGENTS.md) defines the required workflow.
[RESUME_PIPELINE.md](RESUME_PIPELINE.md) explains CV and cover-letter sources,
privacy rules, and rendering commands.

The [deployment workflow](.github/workflows/deploy.yml) builds both sites and
publishes them to GitHub Pages when `main` is pushed. CVs and cover letters
remain local and are not included in the deployed site.

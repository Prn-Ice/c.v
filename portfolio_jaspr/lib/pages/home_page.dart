import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:shared/shared.dart';

import '../components/bumpable_wrap.dart';
import '../components/glass_card.dart';
import '../components/section_container.dart';
import '../config.dart';

class HomePage extends StatelessComponent {
  const HomePage({super.key});

  @override
  Component build(BuildContext context) {
    return div([
      _heroSection(),
      _projectsSection(),
      _skillsSection(),
    ]);
  }

  Component _heroSection() {
    return SectionContainer(
      child: div(classes: 'hero', [
        h1([Component.text('Prince Nna')]),
        h2(classes: 'hero-subtitle', [
          Component.text('Senior Full Stack Engineer'),
        ]),
        p(classes: 'hero-summary', [Component.text(heroSummary)]),
        div(classes: 'hero-ctas', [
          a(
            href: 'https://github.com/Prn-Ice',
            classes: 'btn btn-filled',
            [Component.text('GitHub')],
          ),
          a(
            href: 'https://linkedin.com/in/princenna',
            classes: 'btn btn-outlined',
            [Component.text('LinkedIn')],
          ),
          a(
            href: 'mailto:stormprince77@gmail.com',
            classes: 'btn btn-outlined',
            [Component.text('Contact')],
          ),
        ]),
      ]),
    );
  }

  Component _projectsSection() {
    return SectionContainer(
      child: div(classes: 'section', [
        h2([Component.text('Projects')]),
        div(classes: 'bento-grid', [
          for (final study in caseStudies)
            div(
              classes:
                  study.gridSpan > 1 ? 'bento-cell span-2' : 'bento-cell',
              [
                GlassCard(
                  child: a(
                    href: '$basePath/case-study/${study.slug}',
                    classes: 'card-link',
                    [
                      h3([Component.text(study.title)]),
                      p(classes: 'card-subtitle', [
                        Component.text(study.subtitle),
                      ]),
                      p(classes: 'card-summary', [
                        Component.text(study.summary),
                      ]),
                      BumpableWrap(labels: study.tags),
                    ],
                  ),
                ),
              ],
            ),
        ]),
      ]),
    );
  }

  Component _skillsSection() {
    return SectionContainer(
      child: div(classes: 'section', [
        h2([Component.text('Skills')]),
        div(classes: 'skills-grid', [
          for (final cat in skillCategories)
            GlassCard(
              child: div([
                h3([Component.text(cat.name)]),
                BumpableWrap(labels: cat.skills),
              ]),
            ),
        ]),
      ]),
    );
  }
}

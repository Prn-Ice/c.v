import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:shared/shared.dart';

import '../components/bumpable_wrap.dart';
import '../components/section_container.dart';
import '../config.dart';

class CaseStudyPage extends StatelessComponent {
  const CaseStudyPage({super.key, required this.slug});

  final String slug;

  @override
  Component build(BuildContext context) {
    final study = caseStudies.where((s) => s.slug == slug).firstOrNull;

    if (study == null) {
      return SectionContainer(
        child: div(classes: 'section', [
          h1([Component.text('Project not found')]),
          a(
            href: '$basePath/',
            classes: 'btn btn-filled',
            [Component.text('Back to Home')],
          ),
        ]),
      );
    }

    return div([
      // Hero
      SectionContainer(
        maxWidth: 800,
        child: div(classes: 'case-study-hero', [
          a(href: '$basePath/', classes: 'back-link', [
            span(classes: 'material-icons-outlined', [
              Component.text('arrow_back'),
            ]),
            Component.text(' Back to Projects'),
          ]),
          h1([Component.text(study.title)]),
          if (study.role != null)
            p(classes: 'role', [Component.text(study.role!)]),
          if (study.dateRange != null)
            p(classes: 'date-range', [Component.text(study.dateRange!)]),
          BumpableWrap(labels: study.tags),
        ]),
      ),
      // Sections
      SectionContainer(
        maxWidth: 800,
        child: div([
          for (final section in study.sections)
            article(classes: 'case-study-section', [
              h2([Component.text(section.title)]),
              p([Component.text(section.content)]),
              if (section.bulletPoints != null)
                ul([
                  for (final point in section.bulletPoints!)
                    li([Component.text(point)]),
                ]),
            ]),
          if (study.repoUrl != null)
            a(
              href: study.repoUrl!,
              target: Target.blank,
              classes: 'btn btn-outlined',
              [
                span(classes: 'material-icons-outlined', [
                  Component.text('code'),
                ]),
                Component.text(' View on GitHub'),
              ],
            ),
          div(classes: 'back-nav', [
            a(href: '$basePath/', [
              span(classes: 'material-icons-outlined', [
                Component.text('arrow_back'),
              ]),
              Component.text(' Back to Projects'),
            ]),
          ]),
        ]),
      ),
    ]);
  }
}

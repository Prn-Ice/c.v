import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:shared/shared.dart';

import '../components/glass_card.dart';
import '../components/icon_span.dart';
import '../components/section_container.dart';

class AboutPage extends StatelessComponent {
  const AboutPage({super.key});

  @override
  Component build(BuildContext context) {
    return div([
      _bioSection(),
      _interestsSection(),
      _contactSection(),
    ]);
  }

  Component _bioSection() {
    return SectionContainer(
      child: div(classes: 'section', [
        h1([Component.text('About')]),
        div(classes: 'bio-content', [
          for (final paragraph in bioParagraphs)
            p(classes: 'bio-paragraph', [Component.text(paragraph)]),
          p(classes: 'site-credits', [
            Component.text(siteCreditsPrefix),
            a(href: siteCreditsLinkUrl, [
              Component.text(siteCreditsLinkText),
            ]),
            Component.text('.'),
          ]),
        ]),
      ]),
    );
  }

  Component _interestsSection() {
    return SectionContainer(
      child: div(classes: 'section', [
        h2([Component.text('Beyond Code')]),
        div(classes: 'interests-grid', [
          for (final interest in interests)
            GlassCard(
              child: div(classes: 'interest-row', [
                IconSpan(icon: interest.icon, size: 28),
                div(classes: 'interest-content', [
                  h3([Component.text(interest.title)]),
                  if (interest.linkText != null && interest.linkUrl != null)
                    p([
                      Component.text(
                        interest.description
                            .split(interest.linkText!)
                            .first,
                      ),
                      a(href: interest.linkUrl!, [
                        Component.text(interest.linkText!),
                      ]),
                      Component.text(
                        interest.description
                            .split(interest.linkText!)
                            .skip(1)
                            .join(interest.linkText!),
                      ),
                    ])
                  else
                    p([Component.text(interest.description)]),
                ]),
              ]),
            ),
        ]),
      ]),
    );
  }

  Component _contactSection() {
    return SectionContainer(
      child: div(classes: 'section', [
        h2([Component.text('Get In Touch')]),
        div(classes: 'contact-grid', [
          for (final link in socialLinks)
            GlassCard(
              child: a(
                href: link.url,
                target: Target.blank,
                classes: 'contact-link',
                [
                  IconSpan(icon: link.icon),
                  span([Component.text(link.label)]),
                ],
              ),
            ),
        ]),
      ]),
    );
  }
}

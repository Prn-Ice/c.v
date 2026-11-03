import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/page_head.dart';
import '../components/section_container.dart';
import '../config.dart';
import '../seo.dart';

class JasprDevelopmentPage extends StatelessComponent {
  const JasprDevelopmentPage({super.key});

  @override
  Component build(BuildContext context) {
    return SectionContainer(
      maxWidth: 800,
      child: article(classes: 'section', [
        const PageHead(
          title: jasprDevelopmentTitle,
          description: jasprDevelopmentDescription,
          path: jasprDevelopmentPath,
        ),
        h1([Component.text('Jaspr web developer')]),
        p([
          Component.text(
            'I’m Prince Nna, a full stack engineer building websites in Dart '
            'with Jaspr. I work across web, Flutter, and backend integrations, '
            'with a focus on useful first-page content, shared application '
            'logic, and maintainable code.',
          ),
        ]),
        h2([Component.text('Jaspr projects I’ve built')]),
        h3([
          Component.text('Expert Listing: a Dart website alongside Flutter'),
        ]),
        p([
          Component.text(
            'Rebuilt the property website with server-rendered public pages '
            'and interactive browser islands. The website and Flutter app '
            'consume shared pure-Dart API and Riverpod packages, backed by '
            'the company’s Django REST API. The work includes property search, '
            'listings, authentication, media, and SEO comparison tooling.',
          ),
        ]),
        a(href: '$basePath/case-study/expert-listing/', [
          Component.text('Read the Expert Listing case study'),
        ]),
        h3([
          Component.text(
            'findaphone.ng: a statically generated phone catalogue',
          ),
        ]),
        p([
          Component.text(
            'Founded and built a Nigerian phone-buying platform using Jaspr, '
            'a dart_frog API, and Supabase. The website combines recommendations, '
            'marketplace matching, and reviewed device-support evidence. '
            'Static pages provide useful catalogue content before browser '
            'interactions load.',
          ),
        ]),
        a(href: '$basePath/case-study/findaphone/', [
          Component.text('Read the findaphone.ng case study'),
        ]),
        h2([Component.text('How I approach Dart web development')]),
        ul([
          li([
            Component.text(
              'Choose server rendering or static generation to suit the product and its data.',
            ),
          ]),
          li([
            Component.text(
              'Keep public content, links, and metadata accessible without JavaScript; hydrate only the interactions that need it.',
            ),
          ]),
          li([
            Component.text(
              'Share typed models and business rules with Flutter where that reduces duplication, without coupling the web interface to Flutter.',
            ),
          ]),
          li([
            Component.text(
              'Test rendered HTML, API boundaries, and real browser journeys, including mobile layouts and slow-network behaviour.',
            ),
          ]),
        ]),
        h2([Component.text('Discuss a Jaspr project')]),
        p([
          Component.text('For questions about my work or a Dart web project, '),
          a(href: 'mailto:princenna@proton.me', [Component.text('email me')]),
          Component.text(' or explore the rest of my portfolio.'),
        ]),
        a(href: '$basePath/', [Component.text('Back to all projects')]),
      ]),
    );
  }
}

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../seo.dart';

class PageHead extends StatelessComponent {
  const PageHead({
    super.key,
    required this.title,
    required this.description,
    required this.path,
  });

  final String title;
  final String description;
  final String path;

  @override
  Component build(BuildContext context) {
    final canonical = canonicalUrlFor(path);
    return Document.head(
      title: title,
      meta: {
        'description': description,
        'twitter:card': 'summary',
        'twitter:title': title,
        'twitter:description': description,
      },
      children: [
        link(id: 'canonical', rel: 'canonical', href: canonical),
        for (final entry in {
          'og:title': title,
          'og:description': description,
          'og:url': canonical,
          'og:type': 'website',
          'og:site_name': 'Prince Nna',
        }.entries)
          Component.element(
            tag: 'meta',
            attributes: {'property': entry.key, 'content': entry.value},
          ),
      ],
    );
  }
}

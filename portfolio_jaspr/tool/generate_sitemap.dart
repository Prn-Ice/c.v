import 'dart:io';

import 'package:portfolio_jaspr/seo.dart';

void main() {
  final urls = publicPagePaths
      .map((path) => '  <url><loc>${canonicalUrlFor(path)}</loc></url>')
      .join('\n');
  File('web/sitemap.xml')
      .writeAsStringSync('''<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
$urls
</urlset>
''');
}

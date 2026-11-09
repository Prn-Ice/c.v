import 'package:shared/shared.dart';

const jasprHomeTitle = 'Prince Nna | Jaspr Web Developer & Flutter Engineer';
const jasprHomeDescription =
    'Prince Nna builds websites in Dart with Jaspr and cross-platform Flutter apps. '
    'Explore production work at Expert Listing, findaphone.ng, and more.';
const jasprDevelopmentPath = '/web-development';
const jasprDevelopmentTitle = 'Jaspr Web Developer | Prince Nna';
const jasprDevelopmentDescription =
    'Prince Nna builds server-rendered Dart websites with Jaspr, shares '
    'application logic with Flutter, and tests API integrations.';

String canonicalUrlFor(String path) =>
    '$jasprSiteUrl$path${path.endsWith('/') ? '' : '/'}';

List<String> get publicPagePaths => [
  '/',
  '/about',
  jasprDevelopmentPath,
  for (final study in caseStudies) '/case-study/${study.slug}',
];

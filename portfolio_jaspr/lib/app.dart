import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:shared/shared.dart';

import 'components/cross_ref_banner.dart';
import 'components/footer.dart';
import 'components/nav_bar.dart';
import 'pages/about_page.dart';
import 'pages/case_study_page.dart';
import 'pages/home_page.dart';

export 'styles/app_styles.dart' show appStyles;

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'app-shell', [
      const NavBar(),
      Router(routes: [
        Route(
          path: '/',
          builder: (context, state) => const HomePage(),
        ),
        Route(
          path: '/about',
          builder: (context, state) => const AboutPage(),
        ),
        for (final study in caseStudies)
          Route(
            path: '/case-study/${study.slug}',
            builder: (context, state) => CaseStudyPage(slug: study.slug),
          ),
      ]),
      const CrossRefBanner(),
      const Footer(),
    ]);
  }
}

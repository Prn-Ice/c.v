import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/features/case_study/view/case_study_page.dart';
import 'package:portfolio/features/home/widgets/hero_section.dart';
import 'package:shared/data/site_config.dart';

void main() {
  testWidgets('home hero uses the current shared summary', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: SingleChildScrollView(child: HeroSection())),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text(heroSummary), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  for (final width in [390.0, 1280.0]) {
    testWidgets('Expert Listing links render at ${width.toInt()}px', (
      tester,
    ) async {
      tester.view.physicalSize = Size(width, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: CaseStudyPage(slug: 'expert-listing')),
        ),
      );
      await tester.pumpAndSettle();

      for (final label in ['Dart web rewrite', 'Google Play', 'App Store']) {
        final button = find.widgetWithText(OutlinedButton, label);
        expect(button, findsOneWidget);
        await tester.ensureVisible(button);
        await tester.pumpAndSettle();
        expect(button.hitTestable(), findsOneWidget);
      }
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('findaphone live link renders without a repository link', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: CaseStudyPage(slug: 'findaphone')),
      ),
    );
    await tester.pumpAndSettle();
    expect(
      find.widgetWithText(OutlinedButton, 'View live project'),
      findsOneWidget,
    );
    expect(find.widgetWithText(OutlinedButton, 'View on GitHub'), findsNothing);
    expect(tester.takeException(), isNull);
  });
}

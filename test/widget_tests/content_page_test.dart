import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_delivery_app/infra/view_model_factory.dart';
import 'package:food_delivery_app/utils/ui_scaling.dart';
import 'package:food_delivery_app/views/pages/content/content_page.dart';

Widget contentPage() => MaterialApp(
      home: Builder(
        builder: (ctx) {
          SizeConfig().init(ctx);
          return ContentPage(ViewModelFactory.contentVM);
        },
      ),
    );

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized() as TestWidgetsFlutterBinding;

  group("Content Page Tests", () {
    testWidgets("Testing if Content Page shows up", (tester) async {
      await tester.pumpWidget(contentPage());
      await tester.pump();

      /// Verify if [Content Page] shows up.

      expect(
        find.byKey(Key('content_page_loading_spinner')),
        findsOneWidget,
      );

      expect(
        find.byType(CircularProgressIndicator),
        findsOneWidget,
      );
    });

    testWidgets("Testing overflow of Content Page in a mobile screen", (tester) async {
      binding.window.physicalSizeTestValue = const Size(440, 800);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.runAsync(() async {
        await tester.pumpWidget(contentPage());
        await tester.pump();

        /// Verify if [Content Page] shows up.

        expect(
          find.byKey(Key('content_page_loading_spinner')),
          findsOneWidget,
        );

        expect(
          find.byType(CircularProgressIndicator),
          findsOneWidget,
        );
      });
    });

    testWidgets("Testing overflow of Content Page in a tablet screen", (tester) async {
      binding.window.physicalSizeTestValue = const Size(1024, 768);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.runAsync(() async {
        await tester.pumpWidget(contentPage());
        await tester.pump();

        /// Verify if [Content Page] shows up.

        expect(
          find.byKey(Key('content_page_loading_spinner')),
          findsOneWidget,
        );

        expect(
          find.byType(CircularProgressIndicator),
          findsOneWidget,
        );
      });
    });
  });
}

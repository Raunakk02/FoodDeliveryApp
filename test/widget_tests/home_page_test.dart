import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_delivery_app/infra/view_model_factory.dart';
import 'package:food_delivery_app/utils/ui_scaling.dart';
import 'package:food_delivery_app/views/pages/home_page.dart';
import 'package:food_delivery_app/views/widgets/image_carousel.dart';

Widget homePage() => MaterialApp(
      home: Builder(
        builder: (ctx) {
          SizeConfig().init(ctx);
          return HomePage(ViewModelFactory.homeVM);
        },
      ),
    );

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized() as TestWidgetsFlutterBinding;

  group("Home Page Tests", () {
    testWidgets("Testing if Home Page shows up", (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(homePage());
        await tester.pump();

        /// Verify if [Home Page] shows up.

        expect(
          find.byType(Scaffold),
          findsOneWidget,
        );

        expect(
          find.byType(ImageCarousel),
          findsOneWidget,
        );

        expect(
          find.text('Food'),
          findsOneWidget,
        );
      });
    });

    testWidgets("Testing overflow of Home Page in a mobile screen", (tester) async {
      binding.window.physicalSizeTestValue = const Size(440, 800);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.runAsync(() async {
        await tester.pumpWidget(homePage());
        await tester.pump();

        /// Verify if [Home Page] shows up.

        expect(
          find.byType(Scaffold),
          findsOneWidget,
        );

        expect(
          find.byType(ImageCarousel),
          findsOneWidget,
        );

        expect(
          find.text('Food'),
          findsOneWidget,
        );
      });
    });

    testWidgets("Testing overflow of Home Page in a tablet screen", (tester) async {
      binding.window.physicalSizeTestValue = const Size(1024, 768);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.runAsync(() async {
        await tester.pumpWidget(homePage());
        await tester.pump();

        /// Verify if [Home Page] shows up.

        expect(
          find.byType(Scaffold),
          findsOneWidget,
        );

        expect(
          find.byType(ImageCarousel),
          findsOneWidget,
        );

        expect(
          find.text('Food'),
          findsOneWidget,
        );
      });
    });
  });
}

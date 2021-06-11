import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_delivery_app/infra/view_model_factory.dart';
import 'package:food_delivery_app/utils/ui_scaling.dart';
import 'package:food_delivery_app/views/pages/menu/cart_page.dart';

Widget cartPage() => MaterialApp(
      home: Builder(
        builder: (ctx) {
          SizeConfig().init(ctx);
          return CartPage(ViewModelFactory.cartVM);
        },
      ),
    );

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized() as TestWidgetsFlutterBinding;

  group("Cart Page Tests", () {
    testWidgets("Testing if Cart Page shows up", (tester) async {
      await tester.pumpWidget(cartPage());
      await tester.pump();

      /// Verify if [Cart Page] shows up.

      expect(
        find.byKey(Key('cart_scaffold')),
        findsOneWidget,
      );

      expect(
        find.byType(Scaffold),
        findsOneWidget,
      );
    });

    testWidgets("Testing overflow of Cart Page in a mobile screen", (tester) async {
      binding.window.physicalSizeTestValue = const Size(440, 800);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.runAsync(() async {
        await tester.pumpWidget(cartPage());
        await tester.pump();

        /// Verify if [Cart Page] shows up.

        expect(
          find.byKey(Key('cart_scaffold')),
          findsOneWidget,
        );

        expect(
          find.byType(Scaffold),
          findsOneWidget,
        );
      });
    });

    testWidgets("Testing overflow of Cart Page in a tablet screen", (tester) async {
      binding.window.physicalSizeTestValue = const Size(1024, 768);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.runAsync(() async {
        await tester.pumpWidget(cartPage());
        await tester.pump();

        /// Verify if [Cart Page] shows up.

        expect(
          find.byKey(Key('cart_scaffold')),
          findsOneWidget,
        );

        expect(
          find.byType(Scaffold),
          findsOneWidget,
        );
      });
    });

    testWidgets("Testing if Cart Page in empty", (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(cartPage());
        await tester.pump();

        /// Verify if [Cart Page] shows up.

        expect(
          find.byKey(Key('cart_scaffold')),
          findsOneWidget,
        );

        expect(
          find.byType(Scaffold),
          findsOneWidget,
        );

        /// Verify if [Cart Page] is empty
        expect(
          find.byIcon(Icons.emoji_food_beverage),
          findsOneWidget,
        );
      });
    });

    testWidgets("Testing if FAB shows up", (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(cartPage());
        await tester.pump();

        /// Verify if [Cart Page] shows up.

        expect(
          find.byKey(Key('cart_scaffold')),
          findsOneWidget,
        );

        expect(
          find.byType(Scaffold),
          findsOneWidget,
        );

        /// Verify if [Cart Page] is empty
        expect(
          find.byType(FloatingActionButton),
          findsOneWidget,
        );
      });
    });
  });
}

import 'package:flutter/material.dart';
import 'package:food_delivery_app/view_models/page_view_models/menu/cart/cart_view_model.dart';
import 'package:food_delivery_app/view_models/page_view_models/menu/information/information_view_model.dart';
import 'package:food_delivery_app/view_models/page_view_models/menu/orders/orders_view_model.dart';
import 'package:food_delivery_app/views/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => CartViewModel(),
        ),
        Provider(
          create: (_) => OrdersViewModel(),
        ),
        Provider(
          create: (_) => InformationViewModel(),
        ),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

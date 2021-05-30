import 'package:flutter/material.dart';
import 'package:food_delivery_app/infra/view_model_factory.dart';
import 'package:food_delivery_app/models/cart_item/cart_item.dart';
import 'package:food_delivery_app/models/item/item.dart';
import 'package:food_delivery_app/services/local_storage.dart';
import 'package:food_delivery_app/views/pages/home_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ItemAdapter());
  Hive.registerAdapter(CartItemAdapter());
  await Hive.openBox<Item>(LocalStorage.itemBoxName);
  await Hive.openBox<CartItem>(LocalStorage.cartItemsBoxName);
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(ViewModelFactory.homeVM));
  }
}

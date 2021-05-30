import 'package:food_delivery_app/models/cart_item/cart_item.dart';
import 'package:food_delivery_app/models/item/item.dart';
import 'package:hive/hive.dart';

class LocalStorage {
  static String itemBoxName = 'items';
  static String cartItemsBoxName = 'cart_items';

  static Box<Item> getItemsBox = Hive.box<Item>(itemBoxName);
  static Box<CartItem> getCartItemsBox = Hive.box<CartItem>(cartItemsBoxName);
}

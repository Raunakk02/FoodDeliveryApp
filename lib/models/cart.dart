import 'package:food_delivery_app/models/cart_item.dart';

class Cart {
  List<CartItem> cartItems = [];

  void addToCart(CartItem _item) {
    int index = -1;
    index = cartItems.indexWhere((e) => e.item == _item.item);

    if (index == -1) {
      cartItems.add(_item);
    } else {
      var oldCartItem = cartItems[index];
      cartItems[index] = CartItem(
        id: oldCartItem.id,
        item: oldCartItem.item,
        quantity: oldCartItem.quantity + 1,
      );
    }
  }
}

import 'package:food_delivery_app/view_models/page_view_models/menu/cart/cart_view_model.dart';

class Cart {
  // static List<CartItem> cartItems = [];

  // set addToCart(Item item) {
  //   int index = -1;

  //   if (cartItems.isEmpty) {
  //     cartItems.add(
  //       CartItem(
  //         id: DateTime.now().toIso8601String(),
  //         item: item,
  //         quantity: 1,
  //       ),
  //     );
  //     return;
  //   }

  //   index = cartItems.indexWhere(
  //     (e) {
  //       return e.item == item;
  //     },
  //   );

  //   if (index == -1) {
  //     cartItems.add(
  //       CartItem(
  //         id: DateTime.now().toIso8601String(),
  //         item: item,
  //         quantity: 1,
  //       ),
  //     );
  //   } else {
  //     var oldCartItem = cartItems[index];
  //     cartItems[index] = CartItem(
  //       id: oldCartItem.id,
  //       item: oldCartItem.item,
  //       quantity: oldCartItem.quantity! + 1,
  //     );
  //   }

  //   // print(cartItems.length);
  // }

  // void deleteFromCart(CartItem cItem) {
  //   cartItems.removeWhere((e) => e == cItem);
  // }

  // static CartViewModel cartViewModel = CartViewModel();

  init() {}
}

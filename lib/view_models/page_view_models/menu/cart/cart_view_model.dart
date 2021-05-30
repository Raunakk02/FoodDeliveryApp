import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/item.dart';
import 'package:food_delivery_app/view_models/base_view_model.dart';
import 'package:mobx/mobx.dart';

part 'cart_view_model.g.dart';

class CartViewModel = _CartViewModel with _$CartViewModel;

abstract class _CartViewModel extends BaseViewModel with Store {
  @observable
  List<CartItem> cartListItems = ObservableList.of(<CartItem>[]);

  @computed
  double get cartTotal => cartListItems.fold<double>(
        0.0,
        (sum, e) => sum += (e.item!.price! * e.quantity!),
      );

  @action
  void addToCart(Item item) {
    int index = -1;

    if (cartListItems.isEmpty) {
      cartListItems.add(
        CartItem(
          id: DateTime.now().toIso8601String(),
          item: item,
          quantity: 1,
        ),
      );
      return;
    }

    index = cartListItems.indexWhere(
      (e) {
        return e.item == item;
      },
    );

    if (index == -1) {
      cartListItems.add(
        CartItem(
          id: DateTime.now().toIso8601String(),
          item: item,
          quantity: 1,
        ),
      );
    } else {
      var oldCartItem = cartListItems[index];
      cartListItems[index] = CartItem(
        id: oldCartItem.id,
        item: oldCartItem.item,
        quantity: oldCartItem.quantity! + 1,
      );
    }

    print(cartListItems.length);
  }

  @action
  void deleteFromCart(CartItem cItem) {
    cartListItems.removeWhere((e) => e == cItem);
  }
}

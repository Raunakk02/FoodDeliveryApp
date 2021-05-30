import 'package:connectivity/connectivity.dart';
import 'package:food_delivery_app/models/cart_item/cart_item.dart';
import 'package:food_delivery_app/models/item/item.dart';
import 'package:food_delivery_app/services/api_service.dart';
import 'package:food_delivery_app/services/connection.dart';
import 'package:food_delivery_app/services/local_storage.dart';
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
  Future<void> fetchCartItemsFromRepo() async {
    var connectivityRes = await Connection.checkConnection();
    if (connectivityRes != ConnectivityResult.none) {
      cartListItems = await ApiService.getCartItemsFromRepo();
      var box = LocalStorage.getCartItemsBox;
      box.clear();
      box.addAll(cartListItems);
    } else {
      var box = LocalStorage.getCartItemsBox;
      cartListItems = box.values.toList();
    }
    return;
  }

  @action
  Future<void> addToCart(Item item) async {
    int index = -1;

    if (cartListItems.isEmpty) {
      cartListItems.add(
        CartItem(
          id: DateTime.now().toIso8601String(),
          item: item,
          quantity: 1,
        ),
      );
      await ApiService.updateCartOnRepo(cartListItems);
      var box = LocalStorage.getCartItemsBox;
      box.clear();
      box.addAll(cartListItems);
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

    await ApiService.updateCartOnRepo(cartListItems);
    var box = LocalStorage.getCartItemsBox;
    box.clear();
    box.addAll(cartListItems);

    print(cartListItems.length);
    return;
  }

  @action
  Future<void> deleteFromCart(CartItem cItem) async {
    cartListItems.removeWhere((e) => e == cItem);
    await ApiService.updateCartOnRepo(cartListItems);
    var box = LocalStorage.getCartItemsBox;
    box.clear();
    box.addAll(cartListItems);
    return;
  }
}

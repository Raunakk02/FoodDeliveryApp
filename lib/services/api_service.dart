import 'package:food_delivery_app/mocks/fake_repository.dart';
import 'package:food_delivery_app/models/cart_item/cart_item.dart';

class ApiService {
  static Future updateCartOnRepo(List<CartItem> cItems) async {
    List<Map<String, Object>> cItemsMap = cItems.map((e) => CartItem.toJSON(e)).toList();
    await FakeRespository.updateCart(cItemsMap);
  }

  static Future<List<CartItem>> getCartItemsFromRepo() async {
    List<CartItem> cItems = [];
    var result = await FakeRespository.getCartItems;
    cItems = result.map((e) => CartItem.fromJSON(e)).toList();
    return cItems;
  }
}

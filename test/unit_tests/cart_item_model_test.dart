import 'package:flutter_test/flutter_test.dart';
import 'package:food_delivery_app/models/cart_item/cart_item.dart';
import 'package:food_delivery_app/models/item/item.dart';

main() {
  final _item = Item(
    id: 'i1',
    type: 'drinks',
    name: 'coke',
    description: 'carbonated',
    price: 20,
    metric: 120,
    unit: 'ml',
    url: 'abc',
  );
  final CartItem _cartItem = CartItem(
    id: 'ci1',
    item: _item,
    quantity: 1,
  );
  group('CartItem Model Tests', () {
    test('Check individual values', () async {
      expect(_cartItem.id, 'ci1');
      expect(_cartItem.item!.id, _item.id);
      expect(_cartItem.item.runtimeType, equals(Item));
      expect(_cartItem.item, isNotNull);
    });

    test('Check JSON conversion', () async {
      final _jsonData = CartItem.toJSON(_cartItem);
      expect(_jsonData['id'], 'ci1');
      expect(_jsonData['id'].runtimeType, String);
      expect((_jsonData['item']! as Map)['url'], 'abc');
    });
  });
}

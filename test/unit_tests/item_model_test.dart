import 'package:flutter_test/flutter_test.dart';
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
  group('Item Model Tests', () {
    test('Check individual values', () async {
      expect(_item.id, 'i1');
      expect(_item.metric, 120);
      expect(_item.runtimeType, equals(Item));
      expect(_item, isNotNull);
    });

    test('Check JSON conversion', () async {
      final _jsonData = Item.toJSON(_item);
      expect(_jsonData['id'], 'i1');
      expect(_jsonData['id'].runtimeType, String);
      expect(_jsonData['url'], 'abc');
    });
  });
}

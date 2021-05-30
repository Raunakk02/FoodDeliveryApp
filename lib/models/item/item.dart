import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'item.g.dart';

@HiveType(typeId: 0)
class Item {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? type;

  @HiveField(2)
  final String? name;

  @HiveField(3)
  final String? description;

  @HiveField(4)
  final double? price;

  @HiveField(5)
  final int? metric;

  @HiveField(6)
  final String? unit;

  @HiveField(7)
  final String? url;

  Item({
    @required this.id,
    @required this.type,
    @required this.name,
    @required this.description,
    @required this.price,
    @required this.metric,
    @required this.unit,
    @required this.url,
  });

  factory Item.fromJSON(Map<String, Object> json) {
    return Item(
        id: json['id'] as String,
        type: json['type'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        price: json['price'] as double,
        metric: json['metric'] as int,
        unit: json['unit'] as String,
        url: json['url'] as String);
  }

  static Map<String, Object> toJSON(Item item) {
    return {
      'id': item.id!,
      'type': item.type!,
      'name': item.name!,
      'description': item.description!,
      'price': item.price!,
      'metric': item.metric!,
      'unit': item.unit!,
      'url': item.url!,
    };
  }
}

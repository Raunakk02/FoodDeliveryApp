import 'package:flutter/foundation.dart';

class Item {
  final String? id;
  final String? type;
  final String? name;
  final String? description;
  final double? price;
  final int? metric;
  final String? unit;
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

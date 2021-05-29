import 'package:flutter/foundation.dart';

class Item {
  final String id;
  final String type;
  final String name;
  final String description;
  final double price;
  final int metric;
  final String unit;
  final String url;

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
        id: json['id'],
        type: json['type'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        metric: json['metric'],
        unit: json['unit'],
        url: json['url']);
  }

  static Map<String, Object> toJSON(Item item) {
    return {
      'id': item.id,
      'type': item.type,
      'name': item.name,
      'description': item.description,
      'price': item.price,
      'metric': item.metric,
      'unit': item.unit,
      'url': item.url,
    };
  }
}

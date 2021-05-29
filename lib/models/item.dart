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
}

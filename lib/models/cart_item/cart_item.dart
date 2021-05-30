import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:food_delivery_app/models/item/item.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 1)
class CartItem extends HiveObject {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final Item? item;

  @HiveField(2)
  final int? quantity;

  CartItem({
    @required this.id,
    @required this.item,
    @required this.quantity,
  });

  factory CartItem.fromJSON(Map<String, Object> json) {
    return CartItem(
      id: json['id'] as String,
      item: Item.fromJSON(json['item'] as Map<String, Object>),
      quantity: json['quantity'] as int,
    );
  }

  static Map<String, Object> toJSON(CartItem cartItem) {
    return {
      'id': cartItem.id!,
      'item': Item.toJSON(cartItem.item!),
      'quantity': cartItem.quantity!,
    };
  }
}

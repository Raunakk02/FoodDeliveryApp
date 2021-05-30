import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/models/item.dart';

class CartItem {
  final String? id;
  final Item? item;
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

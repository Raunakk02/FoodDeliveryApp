// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartViewModel on _CartViewModel, Store {
  Computed<double>? _$cartTotalComputed;

  @override
  double get cartTotal =>
      (_$cartTotalComputed ??= Computed<double>(() => super.cartTotal,
              name: '_CartViewModel.cartTotal'))
          .value;

  final _$cartListItemsAtom = Atom(name: '_CartViewModel.cartListItems');

  @override
  List<CartItem> get cartListItems {
    _$cartListItemsAtom.reportRead();
    return super.cartListItems;
  }

  @override
  set cartListItems(List<CartItem> value) {
    _$cartListItemsAtom.reportWrite(value, super.cartListItems, () {
      super.cartListItems = value;
    });
  }

  final _$_CartViewModelActionController =
      ActionController(name: '_CartViewModel');

  @override
  void addToCart(Item item) {
    final _$actionInfo = _$_CartViewModelActionController.startAction(
        name: '_CartViewModel.addToCart');
    try {
      return super.addToCart(item);
    } finally {
      _$_CartViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteFromCart(CartItem cItem) {
    final _$actionInfo = _$_CartViewModelActionController.startAction(
        name: '_CartViewModel.deleteFromCart');
    try {
      return super.deleteFromCart(cItem);
    } finally {
      _$_CartViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cartListItems: ${cartListItems},
cartTotal: ${cartTotal}
    ''';
  }
}

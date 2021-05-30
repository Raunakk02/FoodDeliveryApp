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

  final _$loadingAtom = Atom(name: '_CartViewModel.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

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

  final _$initAsyncAction = AsyncAction('_CartViewModel.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$addToCartAsyncAction = AsyncAction('_CartViewModel.addToCart');

  @override
  Future<void> addToCart(Item item) {
    return _$addToCartAsyncAction.run(() => super.addToCart(item));
  }

  final _$deleteFromCartAsyncAction =
      AsyncAction('_CartViewModel.deleteFromCart');

  @override
  Future<void> deleteFromCart(CartItem cItem) {
    return _$deleteFromCartAsyncAction.run(() => super.deleteFromCart(cItem));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
cartListItems: ${cartListItems},
cartTotal: ${cartTotal}
    ''';
  }
}

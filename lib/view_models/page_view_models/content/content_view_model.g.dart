// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContentViewModel on _ContentViewModel, Store {
  final _$itemsAtom = Atom(name: '_ContentViewModel.items');

  @override
  List<Item> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<Item> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$loadingAtom = Atom(name: '_ContentViewModel.loading');

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

  final _$getItemsAsyncAction = AsyncAction('_ContentViewModel.getItems');

  @override
  Future<dynamic> getItems() {
    return _$getItemsAsyncAction.run(() => super.getItems());
  }

  @override
  String toString() {
    return '''
items: ${items},
loading: ${loading}
    ''';
  }
}

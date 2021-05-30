// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModel, Store {
  final _$scrollPosAtom = Atom(name: '_HomeViewModel.scrollPos');

  @override
  double get scrollPos {
    _$scrollPosAtom.reportRead();
    return super.scrollPos;
  }

  @override
  set scrollPos(double value) {
    _$scrollPosAtom.reportWrite(value, super.scrollPos, () {
      super.scrollPos = value;
    });
  }

  final _$showFabAtom = Atom(name: '_HomeViewModel.showFab');

  @override
  bool get showFab {
    _$showFabAtom.reportRead();
    return super.showFab;
  }

  @override
  set showFab(bool value) {
    _$showFabAtom.reportWrite(value, super.showFab, () {
      super.showFab = value;
    });
  }

  final _$loadingAtom = Atom(name: '_HomeViewModel.loading');

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

  final _$_HomeViewModelActionController =
      ActionController(name: '_HomeViewModel');

  @override
  void checkposition() {
    final _$actionInfo = _$_HomeViewModelActionController.startAction(
        name: '_HomeViewModel.checkposition');
    try {
      return super.checkposition();
    } finally {
      _$_HomeViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
scrollPos: ${scrollPos},
showFab: ${showFab},
loading: ${loading}
    ''';
  }
}

import 'package:mobx/mobx.dart';

abstract class BaseViewModel {
  List<ReactionDisposer> disposers = [];

  void dispose() {
    disposers.forEach((d) => d());
  }
}

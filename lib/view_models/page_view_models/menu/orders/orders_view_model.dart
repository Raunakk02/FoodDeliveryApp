import 'package:food_delivery_app/view_models/base_view_model.dart';
import 'package:mobx/mobx.dart';

part 'orders_view_model.g.dart';

class OrdersViewModel = _OrdersViewModel with _$OrdersViewModel;

abstract class _OrdersViewModel extends BaseViewModel with Store {
}

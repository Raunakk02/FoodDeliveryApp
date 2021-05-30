import 'package:food_delivery_app/view_models/page_view_models/content/content_view_model.dart';
import 'package:food_delivery_app/view_models/page_view_models/home/home_view_model.dart';
import 'package:food_delivery_app/view_models/page_view_models/menu/cart/cart_view_model.dart';
import 'package:food_delivery_app/view_models/page_view_models/menu/information/information_view_model.dart';
import 'package:food_delivery_app/view_models/page_view_models/menu/orders/orders_view_model.dart';

class ViewModelFactory {
  //registered view models
  static CartViewModel cartVM = CartViewModel();
  static OrdersViewModel ordersVM = OrdersViewModel();
  static InformationViewModel infromationVM = InformationViewModel();
  static ContentViewModel contentVM = ContentViewModel();
  static HomeViewModel homeVM = HomeViewModel();
}

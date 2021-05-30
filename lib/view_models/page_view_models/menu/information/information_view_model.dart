import 'package:food_delivery_app/view_models/base_view_model.dart';
import 'package:mobx/mobx.dart';

part 'information_view_model.g.dart';

class InformationViewModel = _InformationViewModel with _$InformationViewModel;

abstract class _InformationViewModel extends BaseViewModel with Store {
}

import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/ui_scaling.dart';
import 'package:food_delivery_app/view_models/base_view_model.dart';
import 'package:mobx/mobx.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel extends BaseViewModel with Store {
  _HomeViewModel(){
scrollController = ScrollController();
  }


ScrollController? scrollController;

@observable
  double scrollPos = 0.0;

  @observable
  bool showFab = false;

  @observable
  bool loading = false;

  @action
  void checkposition() {
    scrollPos = scrollController!.offset;
    if (scrollPos > SizeConfig.screenHeight! * 0.25) {
      if (showFab == false) {
          showFab = true;
      }
    } else {
      if (showFab == true) {
          showFab = false;
      }
    }
  } 

  

  

}

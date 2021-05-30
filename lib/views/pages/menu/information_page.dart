import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/ui_scaling.dart';
import 'package:food_delivery_app/view_models/page_view_models/menu/information/information_view_model.dart';
import 'package:food_delivery_app/views/base_view.dart';

class InformationPage extends StatelessWidget {
  final InformationViewModel viewModel;

  const InformationPage(
    this.viewModel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: viewModel,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.person_outline,
                size: SizeConfig.safeBlockVertical! * 18,
                color: Colors.black26,
              ),
              Text(
                'Available Soon !',
                style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

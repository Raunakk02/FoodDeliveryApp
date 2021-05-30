import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food_delivery_app/utils/ui_scaling.dart';
import 'package:food_delivery_app/view_models/page_view_models/menu/cart/cart_view_model.dart';
import 'package:food_delivery_app/views/base_view.dart';
import 'package:food_delivery_app/views/pages/menu/menu_page.dart';

class CartFab extends StatelessWidget {
  final CartViewModel viewModel;

  const CartFab(
    this.viewModel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: viewModel,
      child: Stack(
        children: [
          FloatingActionButton(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            child: Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MenuPage(),
                ),
              );
            },
          ),
          Positioned(
            right: SizeConfig.safeBlockHorizontal! * -0.1,
            child: CircleAvatar(
              radius: SizeConfig.safeBlockHorizontal! * 2.5,
              backgroundColor: Colors.lightGreen,
              foregroundColor: Colors.white,
              child: FittedBox(
                child: Observer(
                    name: 'fab text',
                    builder: (_) {
                      print('${viewModel.cartListItems.length}');
                      return Text('${viewModel.cartListItems.length}');
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

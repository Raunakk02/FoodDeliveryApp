import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/ui_scaling.dart';

class CartFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Icon(Icons.shopping_cart_outlined),
          onPressed: () {},
        ),
        Positioned(
          right: SizeConfig.safeBlockHorizontal * -0.1,
          child: CircleAvatar(
            maxRadius: SizeConfig.safeBlockHorizontal * 3,
            backgroundColor: Colors.lightGreen,
            foregroundColor: Colors.white,
            child: Text('1'),
          ),
        ),
      ],
    );
  }
}

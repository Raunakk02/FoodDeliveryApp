import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart.dart';
import 'package:food_delivery_app/utils/ui_scaling.dart';
import 'package:food_delivery_app/views/pages/menu/menu_page.dart';

class CartFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
          right: SizeConfig.safeBlockHorizontal * -0.1,
          child: CircleAvatar(
            radius: SizeConfig.safeBlockHorizontal * 2.5,
            backgroundColor: Colors.lightGreen,
            foregroundColor: Colors.white,
            child: FittedBox(
              child: Text(Cart.cartItems.length.toString()),
              //TODO: implement state management
            ),
          ),
        ),
      ],
    );
  }
}

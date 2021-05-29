import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart.dart';
import 'package:food_delivery_app/utils/ui_scaling.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FutureBuilder(
        future: Future.delayed(
          Duration(seconds: 2),
        ),
        builder: (_, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: Cart.cartItems.length,
                    itemBuilder: (_, index) {
                      return Text('${Cart.cartItems[index].quantity}');
                    },
                  ),
                ),
                Text(
                  'Delivery is free',
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.03,
                ),
                Row(
                  children: [
                    Text(
                      'Value: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '161 usd',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.payment),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: () {
          //TODO: add payment method
        },
      ),
    );
  }
}

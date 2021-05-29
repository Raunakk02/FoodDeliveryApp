import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/utils/ui_scaling.dart';

class CartPage extends StatelessWidget {
  double get _cartTotal {
    return Cart.cartItems.fold<double>(
      0.0,
      (sum, e) => sum += (e.item.price * e.quantity),
    );
  }

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
                      return _buildCartItemCard(Cart.cartItems[index]);
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Value: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$_cartTotal usd',
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

  _buildCartItemCard(CartItem cItem) {
    return ListTile(
      contentPadding: EdgeInsets.only(bottom: SizeConfig.safeBlockHorizontal * 4),
      leading: Container(
        width: SizeConfig.safeBlockHorizontal * 16,
        height: SizeConfig.safeBlockHorizontal * 16,
        child: CachedNetworkImage(
          imageUrl: cItem.item.url,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        cItem.item.name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${cItem.quantity} x ${cItem.item.price} USD',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.cancel,
              color: Colors.grey[400],
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

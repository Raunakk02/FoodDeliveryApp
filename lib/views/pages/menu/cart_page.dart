import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food_delivery_app/models/cart.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/utils/ui_scaling.dart';
import 'package:food_delivery_app/view_models/page_view_models/menu/cart/cart_view_model.dart';
import 'package:food_delivery_app/views/base_view.dart';

class CartPage extends StatelessWidget {
  final CartViewModel viewModel;

  const CartPage(
    this.viewModel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: viewModel,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Observer(builder: (_) {
                if (viewModel.cartListItems.isEmpty) {
                  return Container(
                    height: SizeConfig.safeBlockVertical! * 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(
                          Icons.emoji_food_beverage,
                          size: SizeConfig.safeBlockVertical! * 18,
                          color: Colors.black26,
                        ),
                        Text(
                          'Food & Fun !',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Container(
                  height: SizeConfig.safeBlockVertical! * 50,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: viewModel.cartListItems.length,
                    itemBuilder: (_, index) {
                      return _buildCartItemCard(viewModel.cartListItems[index], context);
                    },
                  ),
                );
              }),
              Text(
                'Delivery is free',
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.03,
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
                  Observer(
                    builder: (_) => Text(
                      '${viewModel.cartTotal} usd',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.payment),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          onPressed: () {
            //TODO: add payment method
          },
        ),
      ),
    );
  }

  _confirmDelete(CartItem cItem, BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (_) => AlertDialog(
        title: Text('Are you sure ?'),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              viewModel.deleteFromCart(cItem);
              Navigator.of(ctx).pop();
            },
          ),
          IconButton(
            icon: Icon(Icons.cancel_outlined),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  _buildCartItemCard(CartItem cItem, BuildContext ctx) {
    return ListTile(
      contentPadding: EdgeInsets.only(bottom: SizeConfig.safeBlockHorizontal! * 4),
      leading: Container(
        width: SizeConfig.safeBlockHorizontal! * 16,
        height: SizeConfig.safeBlockHorizontal! * 16,
        child: CachedNetworkImage(
          imageUrl: cItem.item!.url!,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        cItem.item!.name!,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${cItem.quantity} x ${cItem.item!.price} USD',
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
            onPressed: () {
              _confirmDelete(cItem, ctx);
            },
          ),
        ],
      ),
    );
  }
}

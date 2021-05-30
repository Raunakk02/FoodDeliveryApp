import 'package:flutter/material.dart';
import 'package:food_delivery_app/infra/view_model_factory.dart';
import 'package:food_delivery_app/views/pages/menu/cart_page.dart';
import 'package:food_delivery_app/views/pages/menu/information_page.dart';
import 'package:food_delivery_app/views/pages/menu/orders_page.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Menu',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.black,
            labelStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelColor: Colors.black26,
            unselectedLabelStyle: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
            indicator: BoxDecoration(),
            tabs: [
              Tab(
                child: Text('Cart'),
              ),
              Tab(
                child: Text('Orders'),
              ),
              Tab(
                child: Text('Information'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            CartPage(ViewModelFactory.cartVM),
            OrdersPage(ViewModelFactory.ordersVM),
            InformationPage(ViewModelFactory.infromationVM),
          ],
        ),
      ),
    );
  }
}

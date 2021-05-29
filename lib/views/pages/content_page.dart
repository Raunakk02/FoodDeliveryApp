import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery_app/mocks/fake_repository.dart';
import 'package:food_delivery_app/models/item.dart';
import 'package:food_delivery_app/views/widgets/item_card.dart';

class ContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: FutureBuilder<Object>(
          future: FakeRespository.items,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            List<Map<dynamic, dynamic>> data = snapshot.data as List<Map<dynamic, dynamic>>;
            List<Item> items = data.map((e) => Item.fromJSON(e)).toList();
            return DefaultTabController(
              length: 5,
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                  title: TabBar(
                    isScrollable: true,
                    labelColor: Colors.black,
                    labelStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                    unselectedLabelColor: Colors.black26,
                    unselectedLabelStyle: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w900,
                    ),
                    indicator: BoxDecoration(),
                    tabs: [
                      Tab(
                        child: Text('Pizza'),
                      ),
                      Tab(
                        child: Text('Sushi'),
                      ),
                      Tab(
                        child: Text('Drinks'),
                      ),
                      Tab(
                        child: Text('Pizza'),
                      ),
                      Tab(
                        child: Text('Sushi'),
                      ),
                    ],
                  ),
                ),
                body: TabBarView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    _buildItemList(items, 'pizza'),
                    _buildItemList(items, 'sushi'),
                    _buildItemList(items, 'drinks'),
                    _buildItemList(items, 'pizza'),
                    _buildItemList(items, 'sushi'),
                  ],
                ),
              ),
            );
          }),
    );
  }

  ListView _buildItemList(List<Item> items, String type) {
    List<Item> _filteredItems = [...items];
    _filteredItems.removeWhere((e) => e.type != type);
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: _filteredItems.length,
      itemBuilder: (_, index) {
        return ItemCard(
          foodItem: _filteredItems[index],
        );
      },
    );
  }
}

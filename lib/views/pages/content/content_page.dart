import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food_delivery_app/models/item/item.dart';
import 'package:food_delivery_app/utils/ui_scaling.dart';
import 'package:food_delivery_app/view_models/page_view_models/content/content_view_model.dart';
import 'package:food_delivery_app/views/base_view.dart';
import 'package:food_delivery_app/views/widgets/item_card.dart';

class ContentPage extends StatelessWidget {
  final ContentViewModel viewModel;

  const ContentPage(
    this.viewModel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: viewModel,
      child: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Observer(builder: (_) {
          if (viewModel.loading) {
            return Center(
              child: CircularProgressIndicator(
                key: Key('content_page_loading_spinner'),
              ),
            );
          } else {
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
                    _buildItemList(viewModel.items, 'pizza'),
                    _buildItemList(viewModel.items, 'sushi'),
                    _buildItemList(viewModel.items, 'drinks'),
                    _buildItemList(viewModel.items, 'pizza'),
                    _buildItemList(viewModel.items, 'sushi'),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }

  ListView _buildItemList(List<Item> items, String type) {
    final List<Item> _filteredItems = viewModel.filterItemsByType(items, type);
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

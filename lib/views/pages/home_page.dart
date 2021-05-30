import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food_delivery_app/infra/view_model_factory.dart';
import 'package:food_delivery_app/utils/ui_scaling.dart';
import 'package:food_delivery_app/view_models/page_view_models/home/home_view_model.dart';
import 'package:food_delivery_app/views/pages/content/content_page.dart';
import 'package:food_delivery_app/views/widgets/cart_fab.dart';
import 'package:food_delivery_app/views/widgets/image_carousel.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel viewModel;

  const HomePage(
    this.viewModel, {
    Key? key,
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    widget.viewModel.scrollController!.addListener(() {
      widget.viewModel.checkposition();
    });
  }

  @override
  void dispose() {
    widget.viewModel.scrollController!.removeListener(() {
      widget.viewModel.checkposition();
    });
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        controller: widget.viewModel.scrollController!,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: SizeConfig.screenHeight! * 0.65,
            centerTitle: true,
            title: Column(
              children: [
                Text(
                  'Food',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('delivery'),
              ],
            ),
            flexibleSpace: Stack(
              children: [
                Positioned(
                  child: ImageCarousel(),
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                ),
                Positioned(
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                  ),
                  bottom: -1,
                  left: 0,
                  right: 0,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: ContentPage(ViewModelFactory.contentVM),
          ),
        ],
      ),
      floatingActionButton: Observer(builder: (_) {
        return AnimatedOpacity(
          opacity: widget.viewModel.showFab ? 1 : 0,
          duration: Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          child: CartFab(ViewModelFactory.cartVM),
        );
      }),
    );
  }
}

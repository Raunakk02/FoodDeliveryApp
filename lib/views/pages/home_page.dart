import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery_app/infra/view_model_factory.dart';
import 'package:food_delivery_app/utils/ui_scaling.dart';
import 'package:food_delivery_app/views/pages/content_page.dart';
import 'package:food_delivery_app/views/widgets/cart_fab.dart';
import 'package:food_delivery_app/views/widgets/image_carousel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  var _scrollPos = 0.0;
  bool showFab = false; //TODO: implement view model

  void checkposition() {
    _scrollPos = _scrollController.offset;
    if (_scrollPos > SizeConfig.screenHeight! * 0.25) {
      if (showFab == false) {
        setState(() {
          showFab = true;
        });
      }
    } else {
      if (showFab == true) {
        setState(() {
          showFab = false;
        });
      }
    }
  } //TODO: implement view model

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      checkposition();
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {
      checkposition();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        controller: _scrollController,
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
      floatingActionButton: showFab ? CartFab(ViewModelFactory.cartVM) : null,
    );
  }
}

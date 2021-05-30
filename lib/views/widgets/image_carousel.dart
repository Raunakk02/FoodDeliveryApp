import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/mocks/fake_repository.dart';
import 'package:food_delivery_app/utils/ui_scaling.dart';

class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<String>>(
          future: FakeRespository.offerBanners,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              );
            }
            List<String> urls = snapshot.data!;
            return Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: urls.length,
                  itemBuilder: (_, index, __) {
                    return CachedNetworkImage(
                      imageUrl: urls[index],
                      height: SizeConfig.screenHeight,
                      width: SizeConfig.screenWidth,
                      fit: BoxFit.cover,
                    );
                  },
                  options: CarouselOptions(
                      autoPlay: true,
                      height: SizeConfig.screenHeight,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
                Positioned(
                  bottom: SizeConfig.screenHeight! * 0.05,
                  width: SizeConfig.screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: urls.map((url) {
                      int index = urls.indexOf(url);
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: _current == index ? 12.0 : 8.0,
                        height: _current == index ? 12.0 : 8.0,
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

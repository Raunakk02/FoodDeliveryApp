import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/models/item.dart';
import 'package:food_delivery_app/views/widgets/buy_button.dart';

class ItemCard extends StatelessWidget {
  final Item? foodItem;

  ItemCard({this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 450,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          elevation: 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 450 * 0.5,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: foodItem!.url!,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              foodItem!.name!,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              ' .',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          foodItem!.description!,
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${foodItem!.metric} ${foodItem!.unit}',
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            Spacer(),
                            BuyButton(foodItem!),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

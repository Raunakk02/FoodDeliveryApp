import 'package:flutter/material.dart';
import 'package:food_delivery_app/infra/view_model_factory.dart';
import 'package:food_delivery_app/models/cart.dart';
import 'package:food_delivery_app/models/item.dart';
import 'package:food_delivery_app/view_models/page_view_models/menu/cart/cart_view_model.dart';

class BuyButton extends StatefulWidget {
  final Item foodItem;
  BuyButton(this.foodItem);

  @override
  _BuyButtonState createState() => _BuyButtonState();
}

class _BuyButtonState extends State<BuyButton> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  late Animation<Color?> _colorAnimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _colorAnimation = ColorTween(
      begin: Colors.grey[900],
      end: Colors.lightGreen,
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (_, child) => ElevatedButton(
        onPressed: () {
          _animationController!.forward();
          ViewModelFactory.cartVM.addToCart(widget.foodItem);
          Future.delayed(
            Duration(seconds: 1),
            () {
              _animationController!.reverse();
            },
          );
        },
        child: Text(
          _animationController!.isCompleted ? 'Added +1' : '${widget.foodItem.price} USD',
        ),
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          primary: _colorAnimation.value,
        ),
      ),
    );
  }
}

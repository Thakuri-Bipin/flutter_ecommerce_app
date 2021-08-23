import 'package:ecommerce_bloc/constants/color_constants.dart';
import 'package:ecommerce_bloc/widgets/rounded_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_bloc/config/size_config/size_config.dart';

import 'package:ecommerce_bloc/modules/home/models/product_model.dart';

class ColorDots extends StatefulWidget {
  const ColorDots({
    required this.product,
    required this.increment,
    required this.decrement,
    required this.quantity,
  });

  final ProductModel product;
  final Function() increment;
  final Function() decrement;
  final int quantity;

  @override
  _ColorDotsState createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {
  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    int selectedColor = 3;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(
            widget.product.colors.length,
            (index) => ColorDot(
              color: widget.product.colors[index],
              isSelected: index == selectedColor,
            ),
          ),
          Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press: widget.decrement,
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          Text(
            widget.quantity.toString(),
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: widget.increment,
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    required this.color,
    this.isSelected = false,
  });

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

import 'package:ecommerce_bloc/config/size_config/size_config.dart';
import 'package:ecommerce_bloc/constants/color_constants.dart';
import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  final String text, image;
  const SplashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          'SHOPPING HUB',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36.0),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265.0),
          width: getProportionateScreenWidth(235.0),
        )
      ],
    );
  }
}

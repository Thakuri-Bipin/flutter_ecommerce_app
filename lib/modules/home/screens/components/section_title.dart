import 'package:flutter/material.dart';

import 'package:ecommerce_bloc/config/size_config/size_config.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    @required this.title,
    @required this.press,
  });

  final String? title;
  final GestureTapCallback? press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            "See More",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
        ),
      ],
    );
  }
}

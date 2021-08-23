import 'package:ecommerce_bloc/config/size_config/size_config.dart';
import 'package:ecommerce_bloc/constants/color_constants.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function() onPress;
  const DefaultButton({
    Key? key,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56.0),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: kPrimaryColor,
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18.0),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

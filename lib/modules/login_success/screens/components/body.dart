import 'package:ecommerce_bloc/widgets/custom_curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_bloc/config/size_config/size_config.dart';
import 'package:ecommerce_bloc/widgets/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // bool _isInitState = true;
  // bool _isPopulatingData = false;

  // @override
  // void didChangeDependencies() {
  //   if (_isInitState) {
  //     // setState(() {
  //     //   _isPopulatingData = true;
  //     // });

  //     // Future.delayed(Duration(seconds: 3)).then((value) {
  //     // });
  //     Provider.of<ProductProvider>(context, listen: false)
  //         .populateProductList()
  //         .then((_) {
  //       // setState(() {
  //       //   _isPopulatingData = false;
  //       // });
  //     });
  //     _isInitState = false;
  //   }
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Image.asset(
            "assets/images/success.png",
            height: SizeConfig.screenHeight * 0.4, //40%
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.08),
          Text(
            "Login Success",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: DefaultButton(
              text: "Back to home",
              onPress: () {
                Navigator.of(context).pushReplacementNamed(
                  CustomCurvedNavigationBar.routeName,
                );
              },
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

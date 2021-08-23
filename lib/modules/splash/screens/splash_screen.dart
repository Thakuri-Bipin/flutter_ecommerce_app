import 'package:flutter/material.dart';

import 'package:ecommerce_bloc/config/size_config/size_config.dart';
import 'package:ecommerce_bloc/modules/splash/screens/components/body.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash-screen';

  @override
  Widget build(BuildContext context) {
    // initialize size configs
    SizeConfig().sizeInit(context);
    return Scaffold(
      body: Body(),
    );
  }
}

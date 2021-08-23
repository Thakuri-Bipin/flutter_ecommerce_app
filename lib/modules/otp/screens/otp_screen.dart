import 'package:ecommerce_bloc/config/size_config/size_config.dart';
import 'package:flutter/material.dart';

import '../screens/components/body.dart';

class OtpScreen extends StatelessWidget {
  static const String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().sizeInit(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: Body(),
    );
  }
}

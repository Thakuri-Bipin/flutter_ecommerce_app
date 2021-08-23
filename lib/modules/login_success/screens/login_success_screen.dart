import 'package:flutter/material.dart';

import 'package:ecommerce_bloc/modules/login_success/screens/components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  static const String routeName = "/login_success";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Login Success"),
      ),
      body: Body(),
    );
  }
}

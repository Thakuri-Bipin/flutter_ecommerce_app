import 'package:flutter/material.dart';

import 'package:ecommerce_bloc/modules/sign_in/screens/components/body.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = '/sign_in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignIn'),
      ),
      body: Body(),
    );
  }
}

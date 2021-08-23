import 'package:flutter/material.dart';

import 'package:ecommerce_bloc/modules/sign_up/screens/components/body.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/sign_up';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Body(),
    );
  }
}

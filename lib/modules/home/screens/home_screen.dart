import 'package:flutter/material.dart';

import 'package:ecommerce_bloc/modules/home/screens/components/body.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Body(),
      ),
    );
  }
}

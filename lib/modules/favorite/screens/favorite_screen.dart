import 'package:ecommerce_bloc/modules/favorite/screens/components/body.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  static String routeName = '/favorite';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: Colors.blueAccent,
        // centerTitle: true,
        title: Text(
          'Favorites',
          style: TextStyle(color: Colors.black, fontSize: 25.0),
        ),
      ),
      body: Body(),
    );
  }
}

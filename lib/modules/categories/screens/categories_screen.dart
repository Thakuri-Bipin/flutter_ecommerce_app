import 'package:flutter/material.dart';
import 'package:ecommerce_bloc/modules/categories/screens/components/body.dart';

class CategoriesScreen extends StatelessWidget {
  static String routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: Colors.blueAccent,
        // centerTitle: true,
        title: Text(
          'Categories',
          style: TextStyle(color: Colors.black, fontSize: 25.0),
        ),
      ),
      body: Body(),
    );
  }
}

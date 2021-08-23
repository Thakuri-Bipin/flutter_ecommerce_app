import 'package:ecommerce_bloc/config/size_config/size_config.dart';
import 'package:ecommerce_bloc/modules/categories/screens/categories_screen.dart';
import 'package:ecommerce_bloc/modules/favorite/screens/favorite_screen.dart';
import 'package:ecommerce_bloc/modules/home/screens/home_screen.dart';
import 'package:ecommerce_bloc/modules/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CustomCurvedNavigationBar extends StatefulWidget {
  static const String routeName = '/curved_bottom_navigation';
  @override
  _CustomCurvedNavigationBarState createState() =>
      _CustomCurvedNavigationBarState();
}

class _CustomCurvedNavigationBarState extends State<CustomCurvedNavigationBar> {
  int _currentPageIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig().sizeInit(context);
    List<Widget> _pages = [
      HomeScreen(),
      CategoriesScreen(),
      FavoriteScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: _pages[_currentPageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 55.0,
        items: <Widget>[
          Icon(Icons.home_outlined, size: 25),
          Icon(Icons.category_outlined, size: 25),
          Icon(Icons.favorite_outline_outlined, size: 25),
          Icon(Icons.person_outline, size: 25),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        //backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 500),
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}

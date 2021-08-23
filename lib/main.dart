import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_bloc/config/router/app_router.dart';
import 'package:ecommerce_bloc/config/themes/main_theme.dart';
import 'package:ecommerce_bloc/constants/app_constants.dart';
import 'package:ecommerce_bloc/modules/cart/bloc/bloc/cart_bloc.dart';
import 'package:ecommerce_bloc/modules/favorite/bloc/favorite_bloc.dart';
import 'package:ecommerce_bloc/modules/home/bloc/bloc/home_bloc.dart';
import 'package:ecommerce_bloc/modules/home/repos/home_repository.dart';
import 'package:ecommerce_bloc/widgets/custom_curved_navigation_bar.dart';
//import 'package:ecommerce_bloc/modules/splash/screens/splash_screen.dart';
import 'package:ecommerce_bloc/utils/global_bloc_observer.dart';

void main() {
  Bloc.observer = GlobalBlocObserver();
  HomeRepository homeRepository = HomeRepository();
  runApp(MyApp(homeRepository: homeRepository));
}

class MyApp extends StatelessWidget {
  final HomeRepository homeRepository;
  MyApp({required this.homeRepository});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => FavoriteBloc(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        )
      ],
      child: MaterialApp(
        title: AppConstants.appTitle,
        debugShowCheckedModeBanner: false,
        theme: theme(),
        initialRoute: CustomCurvedNavigationBar.routeName,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}

import 'package:ecommerce_bloc/modules/cart/screens/cart_screen.dart';
import 'package:ecommerce_bloc/modules/categories/screens/categories_screen.dart';
import 'package:ecommerce_bloc/modules/category_products/screens/category_products_screen.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_bloc/modules/complete_profile/screens/complete_profile_screen.dart';
import 'package:ecommerce_bloc/modules/details/screens/details_screen.dart';
import 'package:ecommerce_bloc/modules/home/models/product_model.dart';
import 'package:ecommerce_bloc/modules/login_success/screens/login_success_screen.dart';
import 'package:ecommerce_bloc/modules/not_found_screen/screens/not_found_screen.dart';
import 'package:ecommerce_bloc/modules/otp/screens/otp_screen.dart';
import 'package:ecommerce_bloc/modules/sign_in/screens/sign_in_screen.dart';
import 'package:ecommerce_bloc/modules/sign_up/screens/sign_up_screen.dart';
import 'package:ecommerce_bloc/modules/splash/screens/splash_screen.dart';
import 'package:ecommerce_bloc/widgets/custom_curved_navigation_bar.dart';

// final Map<String, WidgetBuilder> routes = {
//   SplashScreen.routeName: (context) => SplashScreen(),
// };

class AppRouter {
  const AppRouter._();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    if (settings.name == DetailsScreen.routeName) {
      ProductModel args = settings.arguments as ProductModel;

      return MaterialPageRoute(
        builder: (_) => DetailsScreen(product: args),
      );
    }

    if (settings.name == CategoryProductsScreen.routeName) {
      CategoryProductsArguments args =
          settings.arguments as CategoryProductsArguments;

      return MaterialPageRoute(
        builder: (_) => CategoryProductsScreen(
          products: args.products,
          category: args.category,
        ),
      );
    }

    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );

      case SignInScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => SignInScreen(),
        );

      case SignUpScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(),
        );

      case CompleteProfileScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => CompleteProfileScreen(),
        );

      case OtpScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => OtpScreen(),
        );

      case LoginSuccessScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => LoginSuccessScreen(),
        );

      case CustomCurvedNavigationBar.routeName:
        return MaterialPageRoute(
          builder: (_) => CustomCurvedNavigationBar(),
        );

      // case DetailsScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (_) => DetailsScreen(),
      //   );

      case CartScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => CartScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => NotFoundScreen(),
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:slash/features/product_details/presentation/pages/product_details_screen.dart';
import '../../core/utils/widgets.dart';
import '../../features/home/domain/entities/productDetails.dart';
import '../../features/home/presentation/pages/home_screen.dart';


class Routes {
  static const String home = "/";
  static const String productDetails = "productDetails";
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case Routes.productDetails:
        int productId=
        routeSettings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(productId),
        );
      default:
        return MaterialPageRoute(builder: (context) => unDefineRoute());
    }
  }
}
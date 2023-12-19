import 'package:flutter/material.dart';
import '../../core/utils/widgets.dart';
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
      default:
        return MaterialPageRoute(builder: (context) => unDefineRoute());
    }
  }
}
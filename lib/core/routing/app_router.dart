import 'package:bookia/core/routing/routes.dart';
import 'package:bookia/features/auth/presentation/login_screen.dart';
import 'package:bookia/features/bottom_nav_bar/presentation/bottom_nav_bar_screen.dart';
import 'package:bookia/features/home/presentation/home_screen.dart';
import 'package:bookia/features/on_boarding/presentation/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case Routes.obBoarding:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());

      case Routes.bottomNavBarScreen:
        return MaterialPageRoute(builder: (_) => BottomNavBarScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text("Not found"))),
        );
    }
  }
}

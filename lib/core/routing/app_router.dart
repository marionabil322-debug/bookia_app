import 'package:bookia/core/routing/routes.dart';
import 'package:bookia/features/auth/cubit/cubit/auth_cubit_cubit.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:bookia/features/auth/presentation/login_screen.dart';
import 'package:bookia/features/bottom_nav_bar/presentation/bottom_nav_bar_screen.dart';
import 'package:bookia/features/home/cubit/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/home_screen.dart';
import 'package:bookia/features/on_boarding/presentation/on_boarding_screen.dart';
import 'package:bookia/features/product_details/cubit/cubit/product_details_cubit.dart';
import 'package:bookia/features/product_details/presentation/product_details.dart';
import 'package:bookia/features/search/cubit/cubit/search_cubit.dart';
import 'package:bookia/features/search/presentation/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubitCubit(repo: AuthRepo()),
            child: LoginScreen(),
          ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case Routes.obBoarding:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());

      case Routes.bottomNavBarScreen:
        return MaterialPageRoute(builder: (_) => BottomNavBarScreen());
      case Routes.productDetailsScreen:
        int bookId = setting.arguments as int;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                ProductDetailsCubitCubit()..showProduct(bookId),
            child: ProductDetails(),
          ),
        );

      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => SearchCubit()),
              BlocProvider(create: (context) => HomeCubit()),
            ],
            child: SearchScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text("Not found"))),
        );
    }
  }
}

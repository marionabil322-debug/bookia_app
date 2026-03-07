import 'package:bookia/core/routing/app_router.dart';
import 'package:bookia/core/routing/routes.dart';
import 'package:bookia/features/auth/cubit/cubit/auth_cubit_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bookia extends StatelessWidget {
  final String? token;
  const Bookia({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubitCubit(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: "DMSerifDisplay"),
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: startRoute(),
        ),
      ),
    );
  }

  String startRoute() {
    if (token == null) {
      return Routes.obBoarding;
    } else {
      return Routes.bottomNavBarScreen;
    }
  }
}

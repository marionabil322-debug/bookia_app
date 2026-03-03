import 'package:bookia/features/auth/presentation/logen_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bookia extends StatelessWidget {
  const Bookia({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      child: MaterialApp(
        theme: ThemeData(fontFamily: "DMSerifDisplay"),
        home: LogenScreen(),
      ),
    );
  }
}

import 'package:bookia/features/home/presentation/widgets/home_app_bar.dart';
import 'package:bookia/features/home/presentation/widgets/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
      child: Column(
        children: [
          HomeAppBar(),
          SizedBox(height: 20.h),
          HomeSlider(),
        ],
      ),
    );
  }
}

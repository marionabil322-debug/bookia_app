import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottom extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final void Function()? onTap;
  const AppBottom({
    super.key,
    required this.title,
    this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 14.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: backgroundColor ?? AppColor.primaryColor,
          border: Border.all(
            color: backgroundColor == Colors.white
                ? Colors.black
                : AppColor.primaryColor,
          ),
        ),
        child: Text(
          title,
          style: AppTextStyle.text15Regulars.copyWith(
            color: backgroundColor == Colors.white
                ? Colors.black
                : Colors.white,
          ),
        ),
      ),
    );
  }
}

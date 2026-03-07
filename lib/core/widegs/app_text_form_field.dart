import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppTextFormField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const AppTextFormField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.keyboardType,
    this.controller,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      cursorColor: AppColor.primaryColor,
      obscureText: widget.isPassword && isObscure,
      onTapOutside: (v) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyle.text15Regulars.copyWith(
          color: Color(0xFF8391A1),
        ),
        fillColor: Color(0XFFF7F8F9),
        filled: true,
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: isObscure
                      ? Icon(Icons.visibility_off)
                      : SvgPicture.asset(Assets.icons.fluentEye20Filled),
                ),
              )
            : null,
        border: OutlineInputBorder(borderSide: BorderSide()),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor),
        ),
      ),
    );
  }
}

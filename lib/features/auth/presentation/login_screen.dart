import 'package:bookia/core/helper/extensions.dart';
import 'package:bookia/core/routing/routes.dart';
import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widegs/app_bottom.dart';
import 'package:bookia/core/widegs/app_text_form_field.dart';
import 'package:bookia/core/widegs/back_bottom.dart';
import 'package:bookia/features/auth/cubit/cubit/auth_cubit_cubit.dart';
import 'package:bookia/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 12.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBackBottom(),
                SizedBox(height: 28.h),
                Text(
                  "Welcome back! Glad to see you, Again!",
                  style: AppTextStyle.text30Regulars,
                ),
                SizedBox(height: 32.h),
                AppTextFormField(
                  controller: emailController,
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20.h),
                AppTextFormField(
                  controller: passwordcontroller,
                  hintText: "Password",
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                ),
                SizedBox(height: 62.h),
                BlocListener<AuthCubitCubit, AuthCubitState>(
                  listener: (context, state) {
                    if (state is AuthLoadingState) {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => Center(
                          child: CircularProgressIndicator(
                            color: AppColor.primaryColor,
                          ),
                        ),
                      );
                    } else if (state is AuthErrorState) {
                      context.pop();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Error!'),
                            content: Text('Something worng please try again!'),
                          );
                        },
                      );
                    } else if (state is AuthSuccessState) {
                      context.pushNamedAndRemoveUntil(
                        Routes.bottomNavBarScreen,
                        false,
                      );
                    }
                    // TODO: implement listener
                  },
                  child: AppBottom(
                    title: LocaleKeys.Login.tr(),
                    onTap: () {
                      context.read<AuthCubitCubit>().login(
                        email: emailController.text,
                        password: passwordcontroller.text,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

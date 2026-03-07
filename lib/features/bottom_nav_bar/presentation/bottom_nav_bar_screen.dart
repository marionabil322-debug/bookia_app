import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/features/cart/presentation/cart_screen.dart';
import 'package:bookia/features/home/cubit/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/home_screen.dart';
import 'package:bookia/features/home/presentation/widgets/home_app_bar.dart';
import 'package:bookia/features/profile/presentation/profile_screen.dart';
import 'package:bookia/features/wishlist/presentation/wishlist_screen.dart';
import 'package:bookia/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    BlocProvider(
      create: (context) => HomeCubit()..getSliders(),
      child: HomeScreen(),
    ),
    WishlistScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  // List<PreferredSizeWidget> appBar = [
  //   HomeAppBar(),
  //   HomeAppBar(),
  //   HomeAppBar(),
  //   HomeAppBar(),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBar[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.home,
              colorFilter: currentIndex == 0
                  ? ColorFilter.mode(AppColor.primaryColor, BlendMode.srcIn)
                  : null,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.bookmark,
              colorFilter: currentIndex == 1
                  ? ColorFilter.mode(AppColor.primaryColor, BlendMode.srcIn)
                  : null,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.vector,
              colorFilter: currentIndex == 2
                  ? ColorFilter.mode(AppColor.primaryColor, BlendMode.srcIn)
                  : null,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.profile,
              colorFilter: currentIndex == 3
                  ? ColorFilter.mode(AppColor.primaryColor, BlendMode.srcIn)
                  : null,
            ),
            label: '',
          ),
        ],
      ),
      body: SafeArea(child: screens[currentIndex]),
    );
  }
}

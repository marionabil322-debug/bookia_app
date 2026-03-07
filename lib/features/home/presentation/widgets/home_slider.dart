import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/features/home/cubit/cubit/home_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is GetHomeSliderLoading) {
          return CircularProgressIndicator();
        } else if (state is GetHomeSliderSuccess) {
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  enlargeFactor: 1,
                  padEnds: false,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
                items: List.generate(state.sliders.length, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(12.r),
                      child: Image.network(
                        state.sliders[index].image ?? "",
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 14.h),
              AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: state.sliders.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 7.h,
                  activeDotColor: AppColor.primaryColor,
                ),
              ),
            ],
          );
        } else {
          return Text('Error');
        }
      },
    );
  }
}

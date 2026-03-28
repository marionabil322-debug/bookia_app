import 'package:bookia/core/helper/extensions.dart';
import 'package:bookia/features/home/cubit/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/widgets/books_grid_view.dart';
import 'package:bookia/features/home/presentation/widgets/home_app_bar.dart';
import 'package:bookia/features/home/presentation/widgets/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                HomeAppBar(),
                SizedBox(height: 20.h),
                HomeSlider(),
                SizedBox(height: 20.h),
              ],
            ),
          ),

          BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is AddToCartLoading) {
                showDialog(
                  context: context,
                  builder: (context) =>
                      Center(child: CircularProgressIndicator()),
                );
              } else if (state is AddToCartSuccess) {
                context.pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(state.message),
                  ),
                );
              }
            },
            buildWhen: (prev, current) =>
                current is GetBestSellerLoading ||
                current is GetBestSellerSuccess ||
                current is GetBestSellerError,
            builder: (context, state) {
              if (state is GetBestSellerLoading) {
                return const SliverToBoxAdapter(
                  child: BooksGridView(books: [], isLoading: true),
                );
              } else if (state is GetBestSellerSuccess) {
                return SliverToBoxAdapter(
                  child: BooksGridView(
                    books: state.books ?? [],
                    isLoading: false,
                  ),
                );
              } else {
                return const SliverToBoxAdapter(
                  child: Center(child: Text("Error")),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

import 'package:bookia/features/home/cubit/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/widgets/book_itam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooksGridView extends StatelessWidget {
  const BooksGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (prev, current) =>
          current is GetBestSellerSuccess ||
          current is GetBestSellerLoading ||
          current is GetBestSellerError,

      builder: (context, state) {
        if (state is GetBestSellerLoading) {
          return CircularProgressIndicator();
        } else if (state is GetBestSellerSuccess) {
          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 11.h,
              crossAxisSpacing: 11.w,
              childAspectRatio: .6,
            ),
            itemBuilder: (context, index) =>
                BookItam(book: state.books?[index]),
            itemCount: state.books?.length,
          );
        } else {
          return SliverToBoxAdapter(child: Text('Error'));
        }
      },
    );
  }
}

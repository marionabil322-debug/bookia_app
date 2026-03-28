import 'package:bookia/features/home/cubit/cubit/home_cubit.dart';
import 'package:bookia/features/home/data/models/books_model.dart';
import 'package:bookia/features/home/presentation/widgets/book_itam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BooksGridView extends StatelessWidget {
  final List<Product> books;
  final bool isLoading;

  const BooksGridView({super.key, required this.books, this.isLoading = true});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Skeletonizer(
        enabled: true,
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 11.h,
            crossAxisSpacing: 11.w,
            childAspectRatio: .55,
          ),
          itemBuilder: (context, index) => BookItam(
            book: Product(name: "Test", price: '222', image: ''),
          ),
          itemCount: 5,
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 11.h,
        crossAxisSpacing: 11.w,
        childAspectRatio: .6,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return BookItam(
          book: books[index],
          onTap: () {
            context.read<HomeCubit>().addToCart(books?[index].id ?? 0);
          },
        );
      },
    );
  }
}

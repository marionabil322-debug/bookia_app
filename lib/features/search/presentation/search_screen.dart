import 'package:bookia/core/widegs/app_text_form_field.dart';
import 'package:bookia/features/home/presentation/widgets/books_grid_view.dart';
import 'package:bookia/features/search/cubit/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Search')),
        body: Builder(
          builder: (context) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        AppTextFormField(
                          hintText: 'Search',
                          onChanged: (value) {
                            context.read<SearchCubit>().searchAction(value);
                          },
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                  BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      if (state is SearchLoading) {
                        return const SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      } else if (state is SearchSuccess) {
                        return SliverToBoxAdapter(
                          child: BooksGridView(
                            books: state.books ?? [],
                            isLoading: false,
                          ),
                        );
                      } else if (state is SearchError) {
                        return SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(child: Text(state.errorMessage)),
                        );
                      }
                      // الحالة الابتدائية
                      return const SliverToBoxAdapter(child: SizedBox.shrink());
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

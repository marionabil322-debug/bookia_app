import 'package:bloc/bloc.dart';
import 'package:bookia/core/networking/api_result.dart';
import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:bookia/features/home/data/models/books_model.dart';
import 'package:bookia/features/home/data/models/slider_model.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  getHomeData() async {
    await Future.wait([getSliders(), getBestSellerBooks()]);
  }

  Future<void> getSliders() async {
    emit(GetHomeSliderLoading());
    final response = await HomeRepo.getHomeSliders();

    response.when(
      success: (data) {
        emit(GetHomeSliderSuccess(data.data?.sliders ?? []));
      },
      error: (error) {
        emit(GetHomeSliderError(error));
      },
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> getBestSellerBooks() async {
    emit(GetBestSellerLoading());
    final response = await HomeRepo.getBestSellerBooks();
    if (response is BooksModel) {
      emit(GetBestSellerSuccess(response.data?.products ?? []));
    } else {
      emit(GetBestSellerError());
    }
  }

  Future<void> addToCart(int bookId) async {
    emit(AddToCartLoading());
    final response = await CartRepo.addToCart(bookId);
    if (response is String) {
      emit(AddToCartSuccess(response));
    } else {
      emit(AddToCartError() as HomeState);
    }
  }
}

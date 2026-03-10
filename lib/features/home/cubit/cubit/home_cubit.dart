import 'package:bloc/bloc.dart';
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
    if (response is SliderModel) {
      emit(GetHomeSliderSuccess(response.data?.sliders ?? []));
    } else {
      emit(GetHomeSliderError());
    }
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
}

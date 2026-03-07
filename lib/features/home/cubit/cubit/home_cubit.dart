import 'package:bloc/bloc.dart';
import 'package:bookia/features/home/data/models/slider_model.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  getSliders() async {
    emit(GetHomeSliderLoading());
    final response = await HomeRepo.getHomeSliders();
    if (response is SliderModel) {
      emit(GetHomeSliderSuccess(response.data?.sliders ?? []));
    } else {
      emit(GetHomeSliderError());
    }
  }
}

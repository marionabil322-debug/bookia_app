part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetHomeSliderError extends HomeState {}

final class GetHomeSliderSuccess extends HomeState {
  final List<SliderImage> sliders;
  GetHomeSliderSuccess(this.sliders);
}

final class GetHomeSliderLoading extends HomeState {}

final class GetBestSellerLoading extends HomeState {}

final class GetBestSellerSuccess extends HomeState {
  final List<Product>? books;
  GetBestSellerSuccess(this.books);
}

final class GetBestSellerError extends HomeState {}

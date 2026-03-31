part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetHomeSliderError extends HomeState {
  final String errorMessage;
  GetHomeSliderError(this.errorMessage);
}

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

final class AddToCartSuccess extends HomeState {
  final String message;
  AddToCartSuccess(this.message);
}

final class AddToCartError extends HomeState {}

final class AddToCartLoading extends HomeState {}

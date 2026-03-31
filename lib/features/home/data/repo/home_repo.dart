import 'package:bookia/core/networking/api_result.dart';
import 'package:bookia/core/networking/error_handler.dart';
import 'package:bookia/features/home/data/models/books_model.dart';
import 'package:bookia/features/home/data/models/slider_model.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  static Dio _dio = Dio();

  static Future<ApiResult<SliderModel>> getHomeSliders() async {
    try {
      final response = await _dio.get(
        "https://codingarabic.online/api/sliders",
      );
      if (response.statusCode == 200) {
        return ApiResult.success(SliderModel.fromJason(response.data ?? ""));
      } else {
        return ApiResult.error(response?.data["message"]);
      }
    } catch (error) {
      return ApiResult.error(ErrorHandler.handle(error));
    }
  }

  static Future<BooksModel?> getBestSellerBooks() async {
    try {
      final response = await _dio.get(
        "https://codingarabic.online/api/products-bestseller",
      );
      if (response.statusCode == 200) {
        return BooksModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}

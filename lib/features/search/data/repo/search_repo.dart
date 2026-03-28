import 'package:bookia/core/networking/api_constants.dart';
import 'package:bookia/core/networking/dio_factory.dart';
import 'package:bookia/features/home/data/models/books_model.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

class SearchRepo {
  static search(String text) async {
    try {
      final response = await DioFactory.dio?.get(
        ApiConstants.search,
        queryParameters: {'name': text},
      );
      if (response?.statusCode == 200) {
        return BooksModel.fromJson(response?.data);
      } else {
        return response?.data["message"];
      }
    } catch (error) {
      return error.toString();
    }
  }
}

import 'package:bookia/core/networking/api_constants.dart';
import 'package:bookia/core/networking/dio_factory.dart';

class CartRepo {
  static Future addToCart(int bookId) async {
    try {
      final response = await DioFactory.dio?.post(
        ApiConstants.addToCart,
        data: {"product_id": bookId},
      );
      if (response?.statusCode == 201) {
        return response?.data["message"];
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }
}

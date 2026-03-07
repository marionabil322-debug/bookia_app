import 'package:bookia/features/home/data/models/slider_model.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  static Dio _dio = Dio();

  static Future<SliderModel?> getHomeSliders() async {
    try {
      final response = await _dio.get(
        "https://codingarabic.online/api/sliders",
      );
      if (response.statusCode == 200) {
        return SliderModel.fromJason(response.data);
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}

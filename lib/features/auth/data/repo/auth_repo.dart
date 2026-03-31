import 'package:bookia/core/networking/api_result.dart';
import 'package:bookia/core/networking/error_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  static final Dio _dio = Dio();
  Future<ApiResult<String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        'https://codingarabic.online/api/login',
        data: {"email": email, "password": password},
      );

      if (response.statusCode == 200) {
        await saveToken(response.data['data']['token'].toString());
        return ApiResult.success(response?.data['message']);
      } else {
        return ApiResult.error((response?.data['message']));
      }
    } catch (error) {
      return Error(ErrorHandler.handle(error));
    }
  }

  static saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}

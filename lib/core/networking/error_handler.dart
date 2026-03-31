import 'package:dio/dio.dart';

class ErrorHandler {
  static String handle(error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return "Connection timeout, please try again";

        case DioExceptionType.sendTimeout:
          return "Send timeout, please try again";

        case DioExceptionType.receiveTimeout:
          return "Receive timeout, please try again";

        case DioExceptionType.badCertificate:
          return "Bad certificate";

        case DioExceptionType.badResponse:
          return handleBadResponse(error.response?.statusCode);

        case DioExceptionType.cancel:
          return "Request was cancelled";

        case DioExceptionType.connectionError:
          return "No internet connection";

        case DioExceptionType.unknown:
          return "Unexpected error, please try again";
      }
    }
    return error.toString();
  }

  static String handleBadResponse(int? statusCode) {
    switch (statusCode) {
      case 400:
        return "Bad request";
      case 401:
        return "Unauthorized";
      case 403:
        return "Forbidden";
      case 404:
        return "Not found";
      case 500:
        return "Internal server error";
      default:
        return "Something went wrong";
    }
  }
}

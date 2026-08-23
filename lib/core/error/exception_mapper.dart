import 'package:simple_news/core/error/failures.dart';
import "package:dio/dio.dart";

AppFailure mapDioExceptionToFailure(DioException exception) {
  if (exception.type == DioExceptionType.connectionTimeout ||
      exception.type == DioExceptionType.receiveTimeout ||
      exception.type == DioExceptionType.sendTimeout ||
      exception.type == DioExceptionType.connectionError) {
    return NetworkFailure();
  } else if (exception.type == DioExceptionType.badResponse) {
    return ServerFailure();
  } else {
    return UnknownFailure();
  }
}

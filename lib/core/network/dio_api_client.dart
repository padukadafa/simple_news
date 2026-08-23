import 'package:dio/dio.dart';
import 'package:simple_news/core/network/api_client.dart';

class DioApiClient implements ApiClient {
  final Dio _dio;

  DioApiClient(this._dio);

  @override
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    T Function(dynamic data)? converter,
  }) async {
    final response = await _dio.get(path, queryParameters: queryParameters);

    if (converter != null) {
      return converter(response.data);
    }
    return response.data as T;
  }

  @override
  Future<T> post<T>(
    String path, {
    Map<String, dynamic>? body,
    T Function(dynamic data)? converter,
  }) async {
    final response = await _dio.post(path, data: body);
    if (converter != null) {
      return converter(response.data);
    }
    return response.data as T;
  }

  @override
  Future<T> put<T>(
    String path, {
    Map<String, dynamic>? body,
    T Function(dynamic data)? converter,
  }) async {
    final response = await _dio.put(path, data: body);
    if (converter != null) {
      return converter(response.data);
    }
    return response.data as T;
  }

  @override
  Future<T> delete<T>(String path) async {
    final response = await _dio.delete(path);
    return response.data as T;
  }

  @override
  Future<T> patch<T>(
    String path, {
    Map<String, dynamic>? body,
    T Function(dynamic data)? converter,
  }) async {
    final response = await _dio.patch(path, data: body);
    if (converter != null) {
      return converter(response.data);
    }
    return response.data as T;
  }
}

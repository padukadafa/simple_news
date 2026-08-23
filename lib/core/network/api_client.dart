abstract interface class ApiClient {
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    T Function(dynamic data)? converter,
  });
  Future<T> post<T>(
    String path, {
    Map<String, dynamic>? body,
    T Function(dynamic data)? converter,
  });
  Future<T> put<T>(
    String path, {
    Map<String, dynamic>? body,
    T Function(dynamic data)? converter,
  });
  Future<T> delete<T>(String path);
  Future<T> patch<T>(
    String path, {
    Map<String, dynamic>? body,
    T Function(dynamic data)? converter,
  });
}

import 'package:dio/dio.dart';

class CoreInterceptor extends Interceptor {
  final String basePath;
  final String accessToken;

  CoreInterceptor({required this.basePath, required this.accessToken});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.path = basePath + options.path;

    if (accessToken.isNotEmpty) {
      options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    }

    options.validateStatus = (status) {
      if (status == null) {
        return false;
      }
      return status >= 200 && status < 204;
    };

    super.onRequest(options, handler);
  }
}

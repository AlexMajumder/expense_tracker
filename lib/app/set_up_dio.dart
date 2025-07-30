import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import '../core/network_executor/interceptors/core_interceptor.dart';
import '../core/network_executor/interceptors/logger_inceptor.dart';
import 'configurations.dart';


Dio getDioInstance() {
  BaseOptions dioOptions = BaseOptions(
      baseUrl: Configurations.baseUrl,
      connectTimeout: Configurations.connectionTimeout,
      sendTimeout: Configurations.sendTimeout,
      receiveTimeout: Configurations.receiveTimeout,
      headers: {
        'token': 'global token',
        'content-type': 'application/json',
      });

  final Dio dio = Dio(dioOptions);

  List<Interceptor> interceptors = [
    LoggerInterCeptor(),
    CoreInterceptor(
        basePath: Configurations.baseUrl,
        accessToken: Configurations.accessToken),
    RetryInterceptor(dio: dio, retries: 2, retryDelays: [
      const Duration(seconds: 5),
      const Duration(seconds: 10),
    ]),
  ];

  dio.interceptors.addAll(interceptors);

  return dio;
}

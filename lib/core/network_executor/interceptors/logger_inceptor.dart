import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggerInterCeptor extends Interceptor {
  final Logger _logger = Logger();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String message =
        ''' 
    Url: ${options.path}
    Method: ${options.method}
    Headers: ${options.headers}
    Data: ${options.data}
    Query Params: ${options.queryParameters}
    ''';
    _logger.d(message);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    String message =
        ''' 
    Url: ${response.realUri}
    Headers: ${response.headers}
    Status Code: ${response.statusCode}
    Data: ${response.data}
    ''';
    _logger.i(message);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String message =
        ''' 
    Url: ${err.requestOptions.uri}
    Headers: ${err.requestOptions.headers}
    Query Params: ${err.requestOptions.queryParameters}
    Data: ${err.requestOptions.data}
    Error Response: ${err.response}
    ''';

    _logger.d(message);
    super.onError(err, handler);
  }
}

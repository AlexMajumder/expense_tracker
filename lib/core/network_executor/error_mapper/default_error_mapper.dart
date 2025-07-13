import 'dart:ui';
import 'package:dio/dio.dart';
import '../error_mapper/error_mapper.dart';
import '../models/network_response.dart';

class DefaultErrorMapper implements ErrorMapper {
  final VoidCallback onUnauthorized;

  DefaultErrorMapper({required this.onUnauthorized});

  @override
  NetworkResponse mapError(Exception e) {
    if (e is DioException) {
      if (e.response!.statusCode == 401) {
        //TODO: Redirect to login screen
        // lets decide from clint end
        onUnauthorized();
        return NetworkResponse(statusCode: 401, data: e.response!.data);
      } else {
        return NetworkResponse(statusCode: -1, data: e.response!.data);
      }
    } else {
      return NetworkResponse(statusCode: -1, data: 'Something went wrong');
    }
  }
}

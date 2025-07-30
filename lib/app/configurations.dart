import 'package:expense_tracker/app/urls.dart';

class Configurations{
  static const String baseUrl = Urls.baseUrl;
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);
  static const receiveTimeout = Duration(seconds: 30);
  static const String accessToken = 'token';
}
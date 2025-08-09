import 'package:dio/dio.dart';

import '../models/login_request_model.dart';
import '../models/login_response_model.dart';


abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login(LoginRequestModel request);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<LoginResponseModel> login(LoginRequestModel request) async {
    final response = await dio.post(
      '/auth/login',
      data: request.toJson(),
    );
    return LoginResponseModel.fromJson(response.data);
  }
}

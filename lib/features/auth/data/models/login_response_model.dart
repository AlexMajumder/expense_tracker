

import '../../domain/entities/user_entity.dart';

class LoginResponseModel {
  final int id;
  final String email;
  final String fullName;
  final String? avatarUrl;

  LoginResponseModel({
    required this.id,
    required this.email,
    required this.fullName,
    this.avatarUrl,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      id: json['user']['id'],
      email: json['user']['email'],
      fullName: json['user']['fullName'],
      avatarUrl: json['user']['avatarUrl'],
    );
  }

  UserEntity toEntity() => UserEntity(
    id: id,
    email: email,
    fullName: fullName,
    avatarUrl: avatarUrl,
  );
}

class UserEntity {
  final int id;
  final String email;
  final String fullName;
  final String? avatarUrl;

  const UserEntity({
    required this.id,
    required this.email,
    required this.fullName,
    this.avatarUrl,
  });
}

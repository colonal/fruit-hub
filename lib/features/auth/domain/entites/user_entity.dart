class UserEntity {
  final String email;
  final String name;
  final String uId;
  const UserEntity({
    required this.email,
    required this.name,
    required this.uId,
  });

  Map<String, dynamic> toMap() => {'email': email, 'name': name, 'uId': uId};
}

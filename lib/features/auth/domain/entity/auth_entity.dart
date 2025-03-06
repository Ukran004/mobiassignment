import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userId;
  final String fName;
  final String lName;
  final String? image;
  final String phone;
  final String username;
  final String password;

  const AuthEntity({
    this.userId,
    required this.fName,
    required this.lName,
    this.image,
    required this.phone,
    required this.username,
    required this.password,
  });

  AuthEntity copyWith({
    String? userId,
    String? fName,
    String? lName,
    String? image,
    String? phone,
    String? username,
    String? password,
  }) {
    return AuthEntity(
      userId: userId ?? this.userId,
      fName: fName ?? this.fName,
      lName: lName ?? this.lName,
      image: image ?? this.image,
      phone: phone ?? this.phone,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props =>
      [userId, fName, lName, image, phone, username, password];
}

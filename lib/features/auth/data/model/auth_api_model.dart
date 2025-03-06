import 'package:career_connect/features/auth/domain/entity/auth_entity.dart';
import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel extends Equatable {
  @JsonKey(name: 'id')
  final String? id;
  final String firstName;
  final String lastName;
  final String? image;
  final String PhoneNumber;
  final String username;
  final String? password;

  const AuthApiModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.PhoneNumber,
    required this.username,
    required this.password,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // to entity
  AuthEntity toEntity() {
    return AuthEntity(
      userId: id,
      fName: firstName,
      lName: lastName,
      image: image,
      phone: PhoneNumber,
      username: username,
      password: password ?? '',
    );
  }

  // from entity
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      id: entity.userId,
      firstName: entity.fName,
      lastName: entity.lName,
      image: entity.image,
      PhoneNumber: entity.phone,
      username: entity.username,
      password: entity.password,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, firstName,lastName,image,PhoneNumber,username,password];
}

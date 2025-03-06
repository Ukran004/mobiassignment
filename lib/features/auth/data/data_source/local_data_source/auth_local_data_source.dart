import 'dart:io';

import 'package:career_connect/core/network/hive_service.dart';
import 'package:career_connect/features/auth/data/data_source/local_data_source/auth_data_source.dart';
import 'package:career_connect/features/auth/data/model/auth_user_model.dart';
import 'package:career_connect/features/auth/domain/entity/auth_entity.dart';


class AuthLocalDataSource implements IAuthDataSource {
  final HiveService _hiveService;

  AuthLocalDataSource(this._hiveService);

  @override
  Future<AuthEntity> getCurrentUser() {
    // Return Empty AuthEntity
    return Future.value(AuthEntity(
      userId: "1",
      fName: "",
      lName: "",
      image: null,
      phone: "",
      username: "",
      password: "",
    ));
  }

  @override
  Future<String> loginCustomer(String username, String password) async {
    try {
      await _hiveService.login(username, password);
      return Future.value("Success");
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<void> registerCustomer(AuthEntity customer) async {
    try {
      // Convert AuthEntity to AuthHiveModel
      final authHiveModel = AuthHiveModel.fromEntity(customer);

      await _hiveService.register(authHiveModel);
      return Future.value();
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<String> uploadProfilePicture(File file) {
    throw UnimplementedError();
  }
  
  @override
  Future<String> loginStudent(String username, String password) {
    // TODO: implement loginStudent
    throw UnimplementedError();
  }
  
  @override
  Future<void> registerStudent(AuthEntity student) {
    // TODO: implement registerStudent
    throw UnimplementedError();
  }
}

import 'dart:io';

import 'package:career_connect/core/error/failure.dart';
import 'package:career_connect/features/auth/data/data_source/local_data_source/remote_data_source/auth_remote_datasource.dart';
import 'package:career_connect/features/auth/domain/entity/auth_entity.dart';
import 'package:career_connect/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';


class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRemoteRepository(this._authRemoteDataSource);

  @override
  Future<Either<Failure, void>> registerCustomer(AuthEntity customer) async {
    try {
      await _authRemoteDataSource.registerStudent(customer);
      return Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> loginCustomer(
      String username, String password) async {
    try {
      final token =
          await _authRemoteDataSource.loginStudent(username, password);
      return Right(token);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) async {
    try {
      final imageName = await _authRemoteDataSource.uploadProfilePicture(file);
      return Right(imageName);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}

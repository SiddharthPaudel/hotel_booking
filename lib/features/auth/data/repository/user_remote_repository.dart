import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hotel_booking/core/error/failure.dart';
import 'package:hotel_booking/features/auth/data/data_source/remote_datasource/user_remote_data_source.dart';
import 'package:hotel_booking/features/auth/domain/entity/user_entity.dart';
import 'package:hotel_booking/features/auth/domain/repository/user_repository.dart';

class UserRemoteRepository implements IUserRepository {
  final UserRemoteDataSource _userRemoteDataSource;

  UserRemoteRepository(this._userRemoteDataSource);

  @override
  Future<Either<Failure, void>> registerUser(UserEntity userEntity) async {
    try {
      await _userRemoteDataSource.registerUser(userEntity);
      return const Right(null);
    } catch (e) {
      return Left(
        ApiFailure(
          message: 'Error creating user: $e',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String>> uploadImage(File file) async {
    try {
      return Right(await _userRemoteDataSource.uploadImage(file));
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> login(
     String email, String password) async {
    try {
      final token = await _userRemoteDataSource.login(email, password);
      return Right(token);
    } catch (e) {
      return Left(
        ApiFailure(
          statusCode: 400,
          message: e.toString(),
        ),
      );
    }
  }
  
  @override
  Future<Either<Failure, void>> deleteUser(String id) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<UserEntity>>> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }
}

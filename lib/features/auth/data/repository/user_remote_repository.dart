import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hotel_booking/core/error/failure.dart';
import 'package:hotel_booking/features/auth/data/data_source/remote_datasource/student_remote_data_source.dart';
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
  Future<Either<Failure, UserEntity>> login(
      String email, String password) async {
    try {
      // Call the login function and get the LoginResponseEntity
      final loginResponse = await _userRemoteDataSource.login(email, password);

      // Extract the UserEntity from the LoginResponseEntity
      final user = loginResponse.user;

      // Return the UserEntity as a Right value
      return Right(user);
    } catch (e) {
      // Handle any errors and return the failure message
      return Left(
        LocalDatabaseFailure(
          message: 'Login failed: $e',
        ),
      );
    }
  }
}

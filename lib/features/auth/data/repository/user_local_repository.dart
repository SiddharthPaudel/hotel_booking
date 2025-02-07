import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hotel_booking/core/error/failure.dart';
import 'package:hotel_booking/features/auth/data/data_source/local_datasource/user_local_datasource.dart';
import 'package:hotel_booking/features/auth/domain/entity/user_entity.dart';
import 'package:hotel_booking/features/auth/domain/repository/user_repository.dart';


class UserLocalRepository implements IUserRepository {
  final UserLocalDatasource _userLocalDataSource;

  UserLocalRepository({required UserLocalDatasource userLocalDataSource})
   : _userLocalDataSource = userLocalDataSource;

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final currentUser = await _userLocalDataSource.getCurrentUser();
      return Right(currentUser);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

   @override
  Future<Either<Failure, String>> login(
    String email,
    String password,
  ) async{
    try {
      final token = await _userLocalDataSource.loginUser(email, password);
      return Right(token);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }


  @override
  Future<Either<Failure, void>> registerUser(UserEntity user) async {
    try {
      return Right(_userLocalDataSource.registerUser(user));
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadImage(File file) {
    // TODO: implement uploadImage
    throw UnimplementedError();
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

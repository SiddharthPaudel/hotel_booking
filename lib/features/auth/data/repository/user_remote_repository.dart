import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hotel_booking/core/error/failure.dart';
import 'package:hotel_booking/features/auth/data/data_source/remote_datasource/user_remote_data_source.dart';
import 'package:hotel_booking/features/auth/domain/entity/user_entity.dart';
import 'package:hotel_booking/features/auth/domain/entity/user_profile_entity.dart';
import 'package:hotel_booking/features/auth/domain/repository/user_repository.dart';
import 'package:hotel_booking/features/auth/domain/use_case/get_current_user_usecase.dart';

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
   Future<Either<Failure, String>> login(String email, String password) async {
    try {
      // Call the login method from the UserRemoteDataSource
      final token = await _userRemoteDataSource.login(email, password);

      // Return the token wrapped in the Right value (successful result)
      return Right(token);
    } catch (e) {
      // In case of error, return a failure with a status code and message
      return Left(
        ApiFailure(
          statusCode: 400,  // You can change the status code as needed
          message: e.toString(),  // Provide a detailed error message
        ),
      );
    }
  }
 
  @override
    Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final user = await _userRemoteDataSource.getCurrentUser();
      return Right(user);
    } catch (e) {
      return Left(ApiFailure(message: "Error fetching user details: ${e.toString()}"));
    }
  }
@override
Future<Either<Failure, void>> deleteUser(String userId) async {
  try {
    await _userRemoteDataSource.deleteUser(userId);
    return const Right(null);
  } catch (e) {
    return Left(ApiFailure(message: 'Error deleting user: $e'));
  }
}

@override
Future<Either<Failure, List<UserEntity>>> getAllUsers() async {
  try {
    final users = await _userRemoteDataSource.getAllUsers();
    return Right(users);
  } catch (e) {
    return Left(ApiFailure(message: 'Error fetching users: $e'));
  }
}

  Future<Either<Failure, UserProfile>> getUserProfile(String userId) async {
    try {
      final userProfile = await _userRemoteDataSource.getUserProfile(userId);
      return Right(userProfile);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }


    
}

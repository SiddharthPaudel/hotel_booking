import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hotel_booking/features/auth/domain/entity/user_entity.dart';

import '../../../../core/error/failure.dart';

abstract interface class IUserRepository {
  Future<Either<Failure, void>> registerUser(UserEntity users);
  Future<Either<Failure, String>> login(String email, String password);
  Future<Either<Failure, UserEntity>> getCurrentUser();
  Future<Either<Failure, String>> uploadImage(File file);
  Future<Either<Failure, void>> deleteUser(String id);
  Future<Either<Failure, List<UserEntity>>> getAllUsers();
}

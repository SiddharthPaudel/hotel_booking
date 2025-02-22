import 'package:dartz/dartz.dart';
import 'package:hotel_booking/core/error/failure.dart';

import 'package:hotel_booking/features/auth/domain/entity/user_profile_entity.dart';
import 'package:hotel_booking/features/auth/domain/repository/user_repository.dart';

class GetUserProfileUseCase {
  final IUserRepository repository;

  GetUserProfileUseCase(this.repository);

  Future<Either<Failure, UserProfile>> call(String userId) async {
    return await repository.getUserProfile(userId);
  }
}

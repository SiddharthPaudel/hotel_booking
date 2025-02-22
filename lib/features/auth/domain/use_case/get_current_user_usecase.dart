import 'package:dartz/dartz.dart';
import 'package:hotel_booking/core/error/failure.dart';
import 'package:hotel_booking/core/utils/token_utils.dart';

import 'package:hotel_booking/features/auth/domain/entity/user_entity.dart';

import 'package:hotel_booking/features/auth/domain/repository/user_repository.dart';

class GetCurrentUserUseCase {
  final IUserRepository _userRepository;

  GetCurrentUserUseCase(this._userRepository);

  Future<Either<Failure, UserEntity>> execute() async {
    // Get the userId from TokenUtils
    final userId = await TokenUtils.getUserId();

    // If userId is null, return a failure
    if (userId == null) {
      return Left(ApiFailure(message: "User not logged in or invalid token"));
    }

    // Call the repository to get the user details using the userId
    return await _userRepository.getCurrentUser();
  }
}

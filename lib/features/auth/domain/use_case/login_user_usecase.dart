import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_booking/app/usecase/usecase.dart';
import 'package:hotel_booking/core/error/failure.dart';
import 'package:hotel_booking/features/auth/domain/repository/user_repository.dart';

class LoginUserParams extends Equatable {
  final String email;
  final String password;

  const LoginUserParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}

class LoginUserUsecase implements UsecaseWithParams<void, LoginUserParams> {
  final IUserRepository repository;

  const LoginUserUsecase({required this.repository});

  @override
  Future<Either<Failure, void>> call(LoginUserParams params) async {
    try {
      // Call login function from the repository
      final result = await repository.login(params.email, params.password);

      return result.fold(
        (failure) {
          // On failure, return the failure response (including status code and message)
          return Left(ApiFailure(
            message: failure.message,
            statusCode: failure.statusCode ??
                500, // Set default statusCode as 500 if null
          ));
        },
        (_) {
          // On success, return success with no data (void)
          return const Right(null);
        },
      );
    } catch (e) {
      // In case of any unexpected error, we handle it here
      return Left(ApiFailure(
        message: 'An unexpected error occurred: $e',
        statusCode: 500, // Default status code for unhandled exceptions
      ));
    }
  }
}

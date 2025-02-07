import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_booking/app/shared_prefs/token_shared_prefs.dart';
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
  final TokenSharedPrefs tokenSharedPrefs;
  final IUserRepository repository;

  const LoginUserUsecase(this.repository, this.tokenSharedPrefs);

  @override
  Future<Either<Failure, String>> call(LoginUserParams params) {
    return repository.login(params.email, params.password).then((value) {
      return value.fold(
        (failure) => Left(failure),
        (token) {
          tokenSharedPrefs.saveToken(token);
          tokenSharedPrefs.getToken().then((value) {
            print(value);
          });
          return Right(token);
        },
      );
    });
  }
}

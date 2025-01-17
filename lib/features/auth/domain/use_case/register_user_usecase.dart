import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_booking/app/usecase/usecase.dart';
import 'package:hotel_booking/core/error/failure.dart';
import 'package:hotel_booking/features/auth/domain/entity/user_entity.dart';
import 'package:hotel_booking/features/auth/domain/repository/user_repository.dart';


class RegisterUserParams extends Equatable {
  final String? userId;
  final String username;
  final String password;
  final String email;

  const RegisterUserParams({
    this.userId,
    required this.email,
    required this.username,
    required this.password,
  });

  const RegisterUserParams.initial({
    this.userId,
    required this.email,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [userId, username, password, email];
}

class RegisterUsecase implements UsecaseWithParams<void, RegisterUserParams> {
  final IUserRepository repository;
  RegisterUsecase(this.repository);
  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final userEntity = UserEntity(
      userId: params.userId,
      username: params.username,
      email: params.email,
      password: params.password,
    );

    return repository.registerUser(userEntity);
  }
}

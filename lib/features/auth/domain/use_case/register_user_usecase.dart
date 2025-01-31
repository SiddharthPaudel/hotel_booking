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
  final String? image;
  final String email;

  const RegisterUserParams(
      {this.userId,
      required this.email,
      required this.username,
      required this.password,
      this.image});

  @override
  List<Object?> get props => [image, username, password, email];

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'image': image,
    };
  }
}

class RegisterUsecase implements UsecaseWithParams<void, RegisterUserParams> {
  final IUserRepository repository;
  const RegisterUsecase({required this.repository});
  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) async {
    final userEntity = UserEntity(
        userId: null,
        username: params.username,
        email: params.email,
        password: params.password,
        image: params.image);

    return await repository.registerUser(userEntity);
  }
}

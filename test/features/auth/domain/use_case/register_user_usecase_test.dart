import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:hotel_booking/core/error/failure.dart';
import 'package:hotel_booking/features/auth/domain/entity/user_entity.dart';
import 'package:hotel_booking/features/auth/domain/repository/user_repository.dart';

class MockUserRepository extends Mock implements IUserRepository {}

void main() {
  late MockUserRepository repository;
  late RegisterUsecase registerUsecase;

  setUp(() {
    repository = MockUserRepository();
    registerUsecase = RegisterUsecase(repository: repository);

    // ✅ Register fallback values for Mocktail
    registerFallbackValue(
      UserEntity(userId: null, username: '', email: '', password: '', image: null),
    );
  });

  const registerParams = RegisterUserParams(
    username: 'testuser',
    email: 'test@example.com',
    password: 'password123',
    image: 'https://example.com/image.png',
  );

  final userEntity = UserEntity(
    userId: null,
    username: registerParams.username,
    email: registerParams.email,
    password: registerParams.password,
    image: registerParams.image,
  );

test('should call repository.registerUser with correct user entity', () async {
  print('Test Started');

  when(() => repository.registerUser(any()))
      .thenAnswer((_) async => const Right(null));

  print('Mock setup complete');

  final result = await registerUsecase(registerParams);

  print('Result obtained: $result');

  expect(result, const Right(null));

  verify(() => repository.registerUser(any())).called(1);

  print('Test completed successfully');
});


  test('should return Failure when registration fails', () async {
    final failure = ApiFailure(message: 'Registration failed');

    when(() => repository.registerUser(any()))
        .thenAnswer((_) async => Left(failure));

    final result = await registerUsecase(registerParams);

    expect(result, Left(failure));

    verify(() => repository.registerUser(any())).called(1);
  });
}

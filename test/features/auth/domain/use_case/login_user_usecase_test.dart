import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking/core/error/failure.dart';
import 'package:hotel_booking/features/auth/domain/use_case/login_user_usecase.dart';
import 'package:mocktail/mocktail.dart';


import 'token.mock.dart';
import 'user_repo.mock.dart';

void main() {
  late UserRepoMock repository;
  late MockTokenSharedPrefs tokenSharedPrefs;
  late LoginUserUsecase useCase;

 setUp(() {
  repository = UserRepoMock();
  tokenSharedPrefs = MockTokenSharedPrefs();
  useCase = LoginUserUsecase(repository, tokenSharedPrefs);

  registerFallbackValue(const LoginUserParams(email: '', password: ''));
  registerFallbackValue('');
});


  test('should call repository.login with correct credentials and store the token', () async {
  const email = 'siddhartha';
  const password = 'test12345';
  const token = 'mocked_token';

  when(() => repository.login(any(), any())) // Ensure `any()` is used
      .thenAnswer((_) async => const Right(token));

  when(() => tokenSharedPrefs.saveToken(token))
      .thenAnswer((_) async => const Right(null));

  when(() => tokenSharedPrefs.getToken())
      .thenAnswer((_) async => const Right(token));

  final result = await useCase(const LoginUserParams(
    email: email,
    password: password,
  ));

  expect(result, const Right(token));

  verify(() => repository.login(any(), any())).called(1);
  verify(() => tokenSharedPrefs.saveToken(any())).called(1);
  verify(() => tokenSharedPrefs.getToken()).called(1);
});


  test('should return a failure when login fails', () async {
    const email = 'wrong_user';
    const password = 'wrong_pass';
    final failure = ApiFailure(message: 'Invalid credentials');

    when(() => repository.login(email, password))
        .thenAnswer((_) async => Left(failure));

    final result = await useCase(const LoginUserParams(
      email: email,
      password: password,
    ));

    expect(result, Left(failure));

    verify(() => repository.login(email, password)).called(1);
    verifyNever(() => tokenSharedPrefs.saveToken(any()));
    verifyNever(() => tokenSharedPrefs.getToken());

    verifyNoMoreInteractions(repository);
    verifyNoMoreInteractions(tokenSharedPrefs);
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking/core/error/failure.dart';
import 'package:hotel_booking/features/auth/domain/repository/user_repository.dart';
import 'package:hotel_booking/features/auth/domain/use_case/delete_user_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements IUserRepository {}

void main() {
  late DeleteUserUsecase usecase;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = DeleteUserUsecase(userRepository: mockUserRepository);
  });

  test('should delete user successfully', () async {
    // Arrange
    const params = DeleteUserParams(userId: '123');

    when(() => mockUserRepository.deleteUser(params.userId))
        .thenAnswer((_) async => const Right(null));

    // Act
    final result = await usecase(params);

    // Assert
    expect(result, equals(const Right(null)));
    verify(() => mockUserRepository.deleteUser(params.userId)).called(1);
    verifyNoMoreInteractions(mockUserRepository);
  });

  test('should return failure when repository fails', () async {
    // Arrange
    const params = DeleteUserParams(userId: '123');
    final failure = ApiFailure(message: 'Deletion failed', statusCode: 500);

    when(() => mockUserRepository.deleteUser(params.userId))
        .thenAnswer((_) async => Left(failure));

    // Act
    final result = await usecase(params);

    // Assert
    expect(result, equals(Left(failure)));
    verify(() => mockUserRepository.deleteUser(params.userId)).called(1);
    verifyNoMoreInteractions(mockUserRepository);
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking/core/error/failure.dart';
import 'package:hotel_booking/features/auth/domain/entity/user_entity.dart';
import 'package:hotel_booking/features/auth/domain/repository/user_repository.dart';
import 'package:hotel_booking/features/auth/domain/use_case/get_all_user_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements IUserRepository {}

void main() {
  late GetAllUserUsecase usecase;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = GetAllUserUsecase(userRepository: mockUserRepository);
  });

  test('should return list of users on success', () async {
    // Arrange
    final users = [
      UserEntity(
        userId: '1',
        username: 'JohnDoe',
        email: 'johndoe@example.com',
        image: null,
        password: 'password123',
      ),
      UserEntity(
        userId: '2',
        username: 'JaneDoe',
        email: 'janedoe@example.com',
        image: null,
        password: 'password123',
      ),
    ];

    when(() => mockUserRepository.getAllUsers())
        .thenAnswer((_) async => Right(users));

    // Act
    final result = await usecase();

    // Assert
    expect(result, Right(users));
    verify(() => mockUserRepository.getAllUsers()).called(1);
    verifyNoMoreInteractions(mockUserRepository);
  });

  test('should return failure when repository fails', () async {
    // Arrange
    final failure = ApiFailure(message: 'Failed to fetch users', statusCode: 500);

    when(() => mockUserRepository.getAllUsers())
        .thenAnswer((_) async => Left(failure));

    // Act
    final result = await usecase();

    // Assert
    expect(result, Left(failure));
    verify(() => mockUserRepository.getAllUsers()).called(1);
    verifyNoMoreInteractions(mockUserRepository);
  });
}

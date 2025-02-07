import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking/core/error/failure.dart';
import 'package:hotel_booking/features/auth/domain/repository/user_repository.dart';
import 'package:hotel_booking/features/auth/domain/use_case/upload_image_usercase.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements IUserRepository {}

void main() {
  late UploadImageUseCase uploadImageUseCase;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    uploadImageUseCase = UploadImageUseCase(mockUserRepository);
  });

  test('should upload image and return image path on success', () async {
    // Arrange
    var file = File('test_image.png');
    const imagePath = 'path/to/image.png';
    
    when(() => mockUserRepository.uploadImage(file))
        .thenAnswer((_) async => Right(imagePath));

    final params = UploadImageParams(file: file);

    // Act
    final result = await uploadImageUseCase.call(params);

    // Assert
    expect(result, Right(imagePath));
    verify(() => mockUserRepository.uploadImage(file)).called(1);
    verifyNoMoreInteractions(mockUserRepository);
  });

  test('should return failure when image upload fails', () async {
    // Arrange
    var file = File('test_image.png');
    final failure = ApiFailure(message: 'Image upload failed');
    
    when(() => mockUserRepository.uploadImage(file))
        .thenAnswer((_) async => Left(failure));

    final params = UploadImageParams(file: file);

    // Act
    final result = await uploadImageUseCase.call(params);

    // Assert
    expect(result, Left(failure));
    verify(() => mockUserRepository.uploadImage(file)).called(1);
    verifyNoMoreInteractions(mockUserRepository);
  });
}

import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking/core/error/failure.dart';
import 'package:hotel_booking/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:hotel_booking/features/auth/domain/use_case/upload_image_usercase.dart';

import 'package:hotel_booking/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:hotel_booking/features/auth/presentation/view_model/signup/register_state.dart';
import 'package:mocktail/mocktail.dart';

class MockRegisterUseCase extends Mock implements RegisterUsecase {}

class MockUploadImageUsecase extends Mock implements UploadImageUseCase {}

void main() {
  late RegisterBloc registerBloc;
  late MockRegisterUseCase mockRegisterUseCase;
  late MockUploadImageUsecase mockUploadImageUsecase;

  setUp(() {
    mockRegisterUseCase = MockRegisterUseCase();
    mockUploadImageUsecase = MockUploadImageUsecase();
    registerBloc = RegisterBloc(
      registerUsecase: mockRegisterUseCase,
      uploadImageUseCase: mockUploadImageUsecase,
    );

    registerFallbackValue(RegisterUserParams(
      email: '',
      username: '',
      password: '',
      image: '',
    ));

    registerFallbackValue(UploadImageParams(file: File('')));
  });

  tearDown(() {
    registerBloc.close();
  });

  test('Initial state should be RegisterState.initial()', () {
    expect(registerBloc.state, equals(RegisterState.initial()));
  });

  blocTest<RegisterBloc, RegisterState>(
    'Should emit [isLoading: true, isSuccess: false] when registration is started',
    build: () {
      when(() => mockRegisterUseCase.call(any()))
          .thenAnswer((_) async => const Right('User registered successfully'));
      return registerBloc;
    },
    act: (bloc) => bloc.add(RegisterUser(
      email: 'john.doe@example.com',
      username: 'johndoe',
      password: 'securepassword',
    )),
    expect: () => [
      RegisterState(
          isLoading: true,
          isSuccess: false,
          isImageLoading: false,
          isImageSuccess: false),
      RegisterState(
          isLoading: false,
          isSuccess: true,
          isImageLoading: false,
          isImageSuccess: false),
    ],
    verify: (_) {
      verify(() => mockRegisterUseCase.call(any())).called(1);
    },
  );

  blocTest<RegisterBloc, RegisterState>(
    'Should emit [isLoading: true, isImageSuccess: true] when image upload is successful',
    build: () {
      when(() => mockUploadImageUsecase.call(any()))
          .thenAnswer((_) async => const Right('image_path.png'));
      return registerBloc;
    },
    act: (bloc) => bloc.add(LoadImage(file: File('test_image.png'))),
    expect: () => [
      RegisterState(
          isLoading: false,
          isSuccess: false,
          isImageLoading: true,
          isImageSuccess: false),
      RegisterState(
          isLoading: false,
          isSuccess: false,
          isImageLoading: false,
          isImageSuccess: true,
          imageName: 'image_path.png'),
    ],
    verify: (_) {
      verify(() => mockUploadImageUsecase.call(any())).called(1);
    },
  );

  blocTest<RegisterBloc, RegisterState>(
    'Should emit [isLoading: true, isImageSuccess: false] when image upload fails',
    build: () {
      when(() => mockUploadImageUsecase.call(any())).thenAnswer(
          (_) async => Left(ApiFailure(message: 'Image upload failed')));
      return registerBloc;
    },
    act: (bloc) => bloc.add(LoadImage(file: File('test_image.png'))),
    expect: () => [
      RegisterState(
          isLoading: false,
          isSuccess: false,
          isImageLoading: true,
          isImageSuccess: false),
      RegisterState(
          isLoading: false,
          isSuccess: false,
          isImageLoading: false,
          isImageSuccess: false),
    ],
    verify: (_) {
      verify(() => mockUploadImageUsecase.call(any())).called(1);
    },
  );


}

class MockBuildContext extends Mock implements BuildContext {}

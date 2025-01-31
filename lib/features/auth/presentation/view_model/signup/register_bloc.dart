import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_booking/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:hotel_booking/features/auth/domain/use_case/upload_image_usercase.dart';


part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUsecase _registerUsecase;
  final UploadImageUseCase _uploadImageUseCase;

  RegisterBloc({
    required RegisterUsecase registerUsecase,
    required UploadImageUseCase uploadImageUseCase,
  })  : _registerUsecase = registerUsecase,
        _uploadImageUseCase = uploadImageUseCase,
        super(RegisterState.initial()) {
    on<RegisterUser>(_onRegisterUser);
    on<LoadImage>(_onLoadImage);
  }

  void _onLoadImage(
    LoadImage event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isImageLoading: true));
    final result = await _uploadImageUseCase.call(
      UploadImageParams(
        file: event.file,
      ),
    );

    result.fold(
        (l) =>
            emit(state.copyWith(isImageLoading: false, isImageSuccess: false)),
        (r) {
      emit(state.copyWith(
          isImageLoading: false, isImageSuccess: true, imageName: r));
    });
  }

  Future<void> _onRegisterUser(
      RegisterUser event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(isLoading: true));

    final params = RegisterUserParams(
      email: event.email,
      username: event.username,
      password: event.password,
      image: state.imageName,
    );

    print('Registering User with params: ${params.toJson()}');

    final result = await _registerUsecase.call(params);

    print(result);

    result.fold(
        (failure) => emit(state.copyWith(isLoading: false, isSuccess: false)),
        (student) => emit(state.copyWith(isLoading: false, isSuccess: true)));
  }
}

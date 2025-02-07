
import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final bool isImageLoading;
  final bool isImageSuccess;
  final String? imageName;

  RegisterState({
    required this.isLoading,
    required this.isSuccess,
    required this.isImageLoading,
    required this.isImageSuccess,
    this.imageName,
  });

  @override
  List<Object?> get props => [
        isLoading,
        isSuccess,
        isImageLoading,
        isImageSuccess,
        imageName,
      ];

  RegisterState.initial()
      : isLoading = false,
        isSuccess = false,
        isImageLoading = false,
        isImageSuccess = false,
        imageName = null;

  RegisterState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isImageLoading,
    bool? isImageSuccess,
    String? imageName,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isImageLoading: isImageLoading ?? this.isImageLoading,
      isImageSuccess: isImageSuccess ?? this.isImageSuccess,
      imageName: imageName ?? this.imageName,
    );
  }
}

part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class LoadImage extends RegisterEvent {
  final File file;

  const LoadImage({
    required this.file,
  });
}

class RegisterUser extends RegisterEvent {
  final String email;
  final String username;
  final String password;
  final String? image;

  const RegisterUser({
    required this.email,
    required this.username,
    required this.password,
    this.image,
  });

  @override
  List<Object> get props => [email, username, password];
}

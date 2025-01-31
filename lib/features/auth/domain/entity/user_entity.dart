import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? userId;
  final String username;
  final String email;
  final String? image;
  final String password;

  const UserEntity({
    this.userId,
    required this.username,
    required this.email,
    this.image,
    required this.password,
  });

  @override
  List<Object?> get props => [userId, username];
}

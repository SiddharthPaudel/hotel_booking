import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final String? userId;
  final String username;
  final String email;
  final String? image;

  const UserProfile({
    this.userId,
    required this.username,
    required this.email,
    this.image,
  });

  @override
  List<Object?> get props => [userId, username, email, image];

  // Factory constructor to create UserProfile from JSON (API response)
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      userId: json['userId'],
      username: json['username'],
      email: json['email'],
      image: json['image'], // assuming image is optional
    );
  }
}

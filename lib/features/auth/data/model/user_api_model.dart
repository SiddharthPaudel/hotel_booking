import 'package:equatable/equatable.dart';
import 'package:hotel_booking/features/auth/domain/entity/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserApiModel extends Equatable {
  @JsonKey(name: '_id') // Binding for server variable name with studentId
  final String? userId;
  final String username;
  final String email;
  final String? image;
  final String password;

  const UserApiModel({
    this.userId,
    required this.username,
    required this.email,
    this.image,
    required this.password,
  });

  const UserApiModel.empty()
      : userId = '',
        email = '',
        username = '',
        password = '',
        image = '';

  // From JSON
  factory UserApiModel.fromJson(Map<String, dynamic> json) {
    return UserApiModel(
      userId: json['_id'] as String?,
      email: json['email'] as String,
      image: json['image'] as String?,
      username: json['username'] as String,
      password: json['password'] as String,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': userId,
      'email': email,
      'image': image,
      'username': username,
      'password': password,
    };
  }

  // Convert API Object to Entity
  UserEntity toEntity() => UserEntity(
        userId: userId,
        email: email,
        image: image,
        username: username,
        password: password,
      );

  // Convert Entity to API Object
  factory UserApiModel.fromEntity(UserEntity entity) {
    return UserApiModel(
      userId: entity.userId,
      email: entity.email,
      image: entity.image,
      username: entity.username,
      password: entity.password,
    );
  }

  // Convert API List to Entity List
  static List<UserEntity> toEntityList(List<UserApiModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  List<Object?> get props => [
        userId,
        email,
        image,
        username,
        password,
      ];
}

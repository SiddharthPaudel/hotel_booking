import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hotel_booking/app/constants/hive_table_constant.dart';
import 'package:hotel_booking/features/auth/domain/entity/user_entity.dart';

import 'package:uuid/uuid.dart';

part 'user_hive_model.g.dart';
// dart run build_runner build -d

@HiveType(typeId: HiveTableConstant.userTableId)
class UserHiveModel extends Equatable {
  @HiveField(0)
  final String? userId;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String password;

  @HiveField(3)
  final String email;

  UserHiveModel({
    String? userId,
    required this.email,
    required this.username,
    required this.password,
  }) : userId = userId ?? const Uuid().v4();

  /// Initial constructor
  const UserHiveModel.initial()
      : userId = '',
        email = '',
        username = '',
        password = '';

  // Convert from entity
  factory UserHiveModel.fromEntity(UserEntity entity) {
    return UserHiveModel(
      userId: entity.userId,
      email: entity.email,
      username: entity.username,
      password: entity.password,
    );
  }

  // Convert to entity
  UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      email: email,
      username: username,
      password: password,
    );
  }

 

  @override
  List<Object?> get props => [
        userId,
        email,
        username,
        password,
      ];
}

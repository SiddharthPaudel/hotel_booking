import 'package:hotel_booking/core/network/hive_service.dart';
import 'package:hotel_booking/features/auth/data/data_source/user_data_source.dart';
import 'package:hotel_booking/features/auth/data/model/user_hive_model.dart';
import 'package:hotel_booking/features/auth/domain/entity/user_entity.dart';

class UserLocalDatasource implements IUserDataSource {
  final HiveService _hiveService;

  UserLocalDatasource(this._hiveService);
  @override
  Future<UserEntity> getCurrentUser() {
    // Return Empty AuthEntity
    return Future.value(const UserEntity(
      userId: "1",
      username: "",
      email: "",
      password: "",
    ));
  }

  @override
  Future<UserEntity> login(String email, String password) async {
    try {
      final userHiveModel = await _hiveService.loginUser(email, password);
      return userHiveModel!.toEntity();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> registerUser(UserEntity user) async {
    try {
      // Convert AuthEntity to AuthHiveModel
      final userHiveModel = UserHiveModel.fromEntity(user);

      await _hiveService.register(userHiveModel);
      return Future.value();
    } catch (e) {
      return Future.error(e);
    }
  }
  
  @override
  Future<String> loginUser(String email, String password) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }
  
  
}

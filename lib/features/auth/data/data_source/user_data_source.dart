
import 'package:hotel_booking/features/auth/domain/entity/user_entity.dart';


abstract interface class IUserDataSource {
Future<String> loginUser(String email, String password);

  Future<void> registerUser(UserEntity user);

  Future<UserEntity> getCurrentUser();
}

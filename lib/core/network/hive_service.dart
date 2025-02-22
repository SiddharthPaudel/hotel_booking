import 'package:hive_flutter/hive_flutter.dart';
import 'package:hotel_booking/app/constants/hive_table_constant.dart';
import 'package:hotel_booking/features/auth/data/model/user_hive_model.dart';
import 'package:path_provider/path_provider.dart';


class HiveService {
  Future<void> init() async {
    //Initialize the database

    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}hotel_booking.db';

    Hive.init(path);

    Hive.registerAdapter(UserHiveModelAdapter());
  }

// Student Queries
  Future<void> register(UserHiveModel user) async {
    var box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    await box.put(user.userId, user);
  }

  Future<void> deleteUser(String id) async {
    var box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    await box.delete(id);
  }

  Future<List<UserHiveModel>> getAllUser() async {
    var box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    var user = box.values.toList();
    return user;
  }

 
  Future<UserHiveModel?> loginUser(String email, String password) async {
    var box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    var auth = box.values.firstWhere(
            (element) =>
        element.username == email && element.password == password,
        orElse: () => UserHiveModel.initial());

    return auth;
  }

  }




import 'package:dartz/dartz.dart';
import 'package:hotel_booking/core/error/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenSharedPrefs {
  final SharedPreferences _sharedPreferences;

  TokenSharedPrefs(this._sharedPreferences);

 Future<Either<Failure, void>> saveToken(String token) async {
  try {
    final success = await _sharedPreferences.setString('token', token);
    if (success) {
      print("Token saved successfully: $token");
      return Right(null);
    } else {
      return Left(SharedPrefsFailure(message: "Failed to save token"));
    }
  } catch (e) {
    return Left(SharedPrefsFailure(message: e.toString()));
  }
}

  Future<Either<Failure, String>> getToken() async {
    try {
      final token = _sharedPreferences.getString('token');
      return Right(token ?? '');
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }
}

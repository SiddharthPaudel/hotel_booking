import 'package:dartz/dartz.dart';
import 'package:hotel_booking/core/error/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenSharedPrefs {
  final SharedPreferences _sharedPreferences;

  TokenSharedPrefs(this._sharedPreferences);

  // Save token to SharedPreferences
  Future<Either<Failure, void>> saveToken(String token) async {
    try {
      await _sharedPreferences.setString('token', token);
      return const Right(null);
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }

  // Get token from SharedPreferences
  Future<Either<Failure, String>> getToken() async {
  try {
    final token = _sharedPreferences.getString('token');
    if (token == null || token.isEmpty) {
      return Left(SharedPrefsFailure(message: "No token found"));
    }
    return Right(token);
  } catch (e) {
    return Left(SharedPrefsFailure(message: e.toString()));
  }
}


  // Save userId to SharedPreferences
  Future<Either<Failure, void>> saveUserId(String userId) async {
    try {
      await _sharedPreferences.setString('userId', userId);
      return const Right(null);
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }

  // Get userId from SharedPreferences
  Future<Either<Failure, String?>> getUserId() async {
    try {
      final userId = _sharedPreferences.getString('userId');
      return Right(userId); // Return null if no userId found
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }

  // Remove userId from SharedPreferences (e.g., for logout)
  Future<Either<Failure, void>> removeUserId() async {
    try {
      await _sharedPreferences.remove('userId');
      return const Right(null);
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class TokenSharedPrefs {
  static const String _keyToken = "token";

  // Save the token
  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyToken, token);
  }

  // Retrieve the token
  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyToken);
  }

  // Clear the token
  Future<void> clearToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyToken);
  }

  // Check if token exists
  Future<bool> hasToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_keyToken);
  }
}

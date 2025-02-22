import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenUtils {
  static const String _tokenKey = 'token';  // Key to store token in SharedPreferences

  // Save token to SharedPreferences
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  // Get token from SharedPreferences
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // Remove token (for logout)
  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  // Decode token and extract userId
  static Future<String?> getUserId() async {
    try {
      final token = await getToken();
      if (token == null) return null;

      final decodedToken = JwtDecoder.decode(token);

      if (decodedToken.containsKey('userId')) {
        return decodedToken['userId'];
      } else if (decodedToken.containsKey('_id')) {
        return decodedToken['_id'];
      } else if (decodedToken.containsKey('id')) {
        return decodedToken['id'];
      } else {
        return null;  // User ID not found in token
      }
    } catch (e) {
      return null; // Handle invalid token
    }
  }

  // Check if token is expired
  static Future<bool> isTokenExpired() async {
    final token = await getToken();
    if (token == null) return true;

    return JwtDecoder.isExpired(token);
  }
}

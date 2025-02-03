class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);

  // For Android Emulator
  static const String baseUrl = "http://192.168.1.71:5000/api/";

  // ============= Auth Routes =============
  static const String loginUser = "auth/login";
  static const String registerUser = "auth/register";
  static const String getAllUsers = "auth/getAllUsers";
  static const String updateUser = "auth/updateUser";
  static const String deleteUser = "auth/deleteUser";
  static const String imageUrl = "http://10.0.2.2:3000/uploads/";
  static const String uploadImage = "auth/uploadImage";
}

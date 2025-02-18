import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hotel_booking/app/constants/api_endpoints.dart';
import 'package:hotel_booking/features/auth/data/model/user_api_model.dart';
import 'package:hotel_booking/features/auth/domain/entity/user_entity.dart';
import 'package:http/http.dart' as http;

class UserRemoteDataSource {
  final Dio _dio;
  final String _baseUrl = ApiEndpoints.baseUrl;

  UserRemoteDataSource(this._dio);

  /// Creates a new student
  Future<void> registerUser(UserEntity userEntity) async {
    try {
      // Convert entity to model
      var studentApiModel = UserApiModel.fromEntity(userEntity);
      var response = await _dio.post(
        ApiEndpoints.registerUser,
        data: studentApiModel.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Deletes a student by ID
  Future<void> deleteUser(String userId) async {
    try {
      var response = await _dio.delete(
        '${ApiEndpoints.deleteUser}/$userId',
      );
      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Gets all students
  Future<List<UserEntity>> getAllUsers() async {
    try {
      var response = await _dio.get(ApiEndpoints.getAllUsers);
      if (response.statusCode == 200) {
        var data = response.data as List<dynamic>;
        return data
            .map((student) => UserApiModel.fromJson(student).toEntity())
            .toList();
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Logs in a student
  @override
  Future<String> login(String email, String password) async {
    // Prepare the body as JSON
    final body = json.encode({
      'email': email,
      'password': password,
    });

    // Make the POST request with the correct headers
    final response = await http.post(
      Uri.parse("$_baseUrl${ApiEndpoints.login}"),
      body: body,
      headers: {
        "Content-Type": "application/json", // Correct Content-Type header
      },
    );

    if (response.statusCode == 200) {
      // Parse the response body and extract token or other relevant data
      final responseData = json.decode(response.body);
      return responseData['token']; // Adjust based on actual response structure
    } else {
      throw Exception('Failed to login');
    }
  }

  @override
  Future<String> uploadImage(File file) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        "profilePicture":
            await MultipartFile.fromFile(file.path, filename: fileName)
      });

      Response response =
          await _dio.post(ApiEndpoints.uploadImage, data: formData);

      if (response.statusCode == 200) {
        return response.data['data'];
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception('Network error during profile upload: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }



  /// Gets the current user details


}

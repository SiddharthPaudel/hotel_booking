import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hotel_booking/app/constants/api_endpoints.dart';
import 'package:hotel_booking/features/auth/data/model/user_api_model.dart';
import 'package:hotel_booking/features/auth/domain/entity/user_entity.dart';

import '../../../domain/entity/login_response_entity.dart';

class UserRemoteDataSource {
  final Dio _dio;

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
  Future<LoginResponseEntity> login(String email, String password) async {
    try {
      var response = await _dio.post(
        ApiEndpoints.loginUser,
        data: {
          'email': email,
          'password': password,
        },
      );

      print('Response Data: ${response.data}');

      // Check if response is not null and has statusCode 200
      if (response.statusCode == 200 && response.data != null) {
        var responseData = response.data;

        // Ensure the response contains necessary data, including 'token'
        String? token = responseData['token'];

        if (token != null) {
          // Safely handle nullable fields
          return LoginResponseEntity(
            user: UserEntity(
              username: '',
              email: '',
              password: '',
            ),
            token: token,
          );
        } else {
          throw Exception('Response does not contain valid token');
        }
      } else {
        throw Exception('Invalid response: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Dio Error: ${e.message ?? 'Unknown error'}');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
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
}

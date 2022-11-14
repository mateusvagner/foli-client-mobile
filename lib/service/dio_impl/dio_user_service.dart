import 'package:dio/dio.dart';

import 'package:foli_client_mobile/resource/new_user_resource.dart';
import 'package:foli_client_mobile/service/user_service.dart';
import 'package:foli_client_mobile/data/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioUserService implements UserService {
  final Dio _dio;

  DioUserService(this._dio);

  @override
  Future<NewUserResource?> postNewUser(NewUserResource newUserResource) async {
    try {
      var response = await _dio.post(
        '/user/new',
        data: newUserResource.toMap(),
      );

      return NewUserResource.fromMap(response.data);
    } catch (e) {
      // TODO implement error handling
      return null;
    }
  }

  @override
  Future<String?> getAccessToken(String email, String password) async {
    try {
      var response = await _dio.post(
        '/user/login',
        data: {'email': email, 'password': password},
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );

      var token = response.data as String;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(SharedPreferencesKeys.jwtToken.name, token);

      return response.data as String;
    } catch (e) {
      // TODO implement error handling
      return null;
    }
  }
}

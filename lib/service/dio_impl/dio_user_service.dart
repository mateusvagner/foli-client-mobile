import 'package:dio/dio.dart';

import 'package:foli_client_mobile/resource/new_user_resource.dart';
import 'package:foli_client_mobile/service/user_service.dart';

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
}

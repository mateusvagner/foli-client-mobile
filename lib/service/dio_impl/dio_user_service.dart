import 'package:dio/dio.dart';

import 'package:foli_client_mobile/resource/new_user_resource.dart';
import 'package:foli_client_mobile/service/user_service.dart';
import 'package:foli_client_mobile/service/user_service_url.dart';

class DioUserService implements UserService {
  @override
  UserServiceURL userServiceURL;

  DioUserService({
    required this.userServiceURL,
  });

  @override
  Future<NewUserResource?> postNewUser(NewUserResource newUserResource) async {
    try {
      var response = await Dio().post(
        userServiceURL.postNewUser,
        data: newUserResource.toMap(),
      );

      return NewUserResource.fromMap(response.data);
    } catch (e) {
      rethrow;
    }
  }
}

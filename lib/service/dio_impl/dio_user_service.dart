import 'dart:convert';

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
    String url = '${UserServiceURL.baseUrl}${UserServiceURL.basePath}${UserServiceURL.postNewUser}';
    try {
      var data = newUserResource.toMap();
      var response = await Dio().post(url, data: data);
      var teste = NewUserResource.fromMap(response.data);
      return teste;

    } catch (e) {
      rethrow;
    }
  }

}

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/shared_preferences_keys.dart';

class DioRefreshTokenInterceptor extends Interceptor {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (kDebugMode) {
      print('REQUEST[${options.method}] => PATH: ${options.path}');
    }

    if (options.headers.containsKey("requiresAuthorization")) {
      options.headers.remove("requiresAuthorization");

      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.get(SharedPreferencesKeys.jwtToken.name);

      options.headers.addAll({'Authorization': 'Bearer $token'});

      return handler.next(options);
    }

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    if (kDebugMode) {
      print(
          'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    }

    // TODO Do something with response data

    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (kDebugMode) {
      print(
          'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    }

    // TODO Do something with response error

    return super.onError(err, handler);
  }
}

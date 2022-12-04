import 'package:dio/dio.dart';

import 'dio_refresh_token_interceptor.dart';

class DioFactory {
  static Dio createDioForUser() {
    return Dio(
      BaseOptions(
          connectTimeout: 5000,
          receiveTimeout: 5000,
          baseUrl: "https://10.0.2.2:8444"), // http://10.0.2.2:8082
    );
  }

  static Dio createDioForRegister() {
    return Dio(
      BaseOptions(
          connectTimeout: 5000,
          receiveTimeout: 5000,
          baseUrl: "https://10.0.2.2:8443"), // http://10.0.2.2:8080
    );
  }

  static Dio createDioForQuote() {
    return Dio(
      BaseOptions(
          connectTimeout: 5000,
          receiveTimeout: 5000,
          baseUrl: "https://10.0.2.2:8445"), // http://10.0.2.2:8084
    );
  }

  static Dio addRefreshTokenInterceptors(Dio dio) {
    return dio..interceptors.add(DioRefreshTokenInterceptor());
  }

}

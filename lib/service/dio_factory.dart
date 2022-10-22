import 'package:dio/dio.dart';
import 'package:foli_client_mobile/service/interceptor/refresh_token_interceptor.dart';

class DioFactory {

  static Dio createDio() {
    return Dio(BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 5000,
        baseUrl: "http://10.0.2.2:8080"));
  }

  static Dio addRefreshTokenInterceptors(Dio dio) {
    return dio..interceptors.add(RefreshTokenInterceptor());
  }
}

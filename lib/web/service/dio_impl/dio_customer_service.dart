import 'package:dio/dio.dart';

import '../../resource/customer_resource.dart';
import '../customer_service.dart';

class DioCustomerService implements CustomerService {
  final Dio _dio;

  DioCustomerService(this._dio);

  @override
  Future<List<CustomerResource>> getAllCustomers() async {
    try {
      var response = await _dio.get(
        '/register/customer/all',
        options: Options(headers: {"requiresAuthorization": true}),
      );

      return (response.data as List)
          .map((e) => CustomerResource.fromMap(e))
          .toList();
    } catch (e) {
      // TODO implement error handling
      return List.empty();
    }
  }

  @override
  Future<CustomerResource?> postNewCustomer(CustomerResource customerResource) async {
    try {
      var response = await _dio.post(
        '/register/customer/new',
        data: customerResource.toMap(),
        options: Options(headers: {"requiresAuthorization": true}),
      );

      return CustomerResource.fromMap(response.data);
    } catch (e) {
      // TODO implement error handling
      return null;
    }
  }
}

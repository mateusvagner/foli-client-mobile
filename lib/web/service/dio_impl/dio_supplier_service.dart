import 'package:dio/dio.dart';

import '../../resource/supplier_resource.dart';
import '../supplier_service.dart';


class DioSupplierService implements SupplierService {
  final Dio _dio;

  DioSupplierService(this._dio);

  @override
  Future<List<SupplierResource>> getAllSuppliers() async {
    try {
      var response = await _dio.get(
        '/register/supplier/all',
        options: Options(headers: {"requiresAuthorization": true}),
      );

      return (response.data as List)
          .map((e) => SupplierResource.fromMap(e))
          .toList();
    } catch (e) {
      // TODO implement error handling
      return List.empty();
    }
  }

  @override
  Future<SupplierResource?> postNewSupplier(
      SupplierResource supplierResource) async {
    try {
      var response = await _dio.post(
        '/register/supplier/new',
        data: supplierResource.toMap(),
        options: Options(headers: {"requiresAuthorization": true}),
      );

      return SupplierResource.fromMap(response.data);
    } catch (e) {
      // TODO implement error handling
      return null;
    }
  }
}

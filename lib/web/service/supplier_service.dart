
import '../resource/supplier_resource.dart';

abstract class SupplierService {

  Future<SupplierResource?> postNewSupplier(SupplierResource supplierResource);

  Future<List<SupplierResource>> getAllSuppliers();

}

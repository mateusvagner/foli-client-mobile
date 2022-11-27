
import '../resource/customer_resource.dart';

abstract class CustomerService {

  Future<CustomerResource?> postNewCustomer(CustomerResource customerResource);

  Future<List<CustomerResource>> getAllCustomers();

}

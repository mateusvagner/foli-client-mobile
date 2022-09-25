import 'package:foli_client_mobile/service/user_service_url.dart';

import '../resource/new_user_resource.dart';

abstract class UserService {

  abstract UserServiceURL userServiceURL;

  Future<NewUserResource?> postNewUser(NewUserResource newUserResource);

}
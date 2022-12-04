import '../resource/new_user_resource.dart';

abstract class UserService {

  Future<NewUserResource?> postNewUser(NewUserResource newUserResource);

  Future<String?> getAccessToken(String email, String password);

}

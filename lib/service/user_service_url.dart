class UserServiceURL {

  static const String _baseUrl = "http://10.0.2.2:8080";
  static const String _basePath = "/user";

  String postNewUser;

  UserServiceURL({
    this.postNewUser = "$_baseUrl$_basePath/new",
  });
}

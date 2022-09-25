import 'dart:convert';

class NewUserResource {
  String name;
  String email;
  String password;

  NewUserResource({
    required this.name,
    required this.email,
    required this.password,
  });

  String getName() {
    return name;
  }

  void setName(String name) {
    this.name = name;
  }

  String getEmail() {
    return email;
  }

  void setEmail(String email) {
    this.email = email;
  }

  String getPassword() {
    return password;
  }

  void setPassword(String password) {
    this.password = password;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory NewUserResource.fromMap(Map<String, dynamic> map) {
    return NewUserResource(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NewUserResource.fromJson(String source) =>
      NewUserResource.fromMap(json.decode(source));
}

import 'dart:convert';

class CustomerResource {
  String name;
  String phone;
  String email;
  String address;

  CustomerResource({
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
  });

  String getName() {
    return name;
  }

  void setName(String name) {
    this.name = name;
  }

  String getPhone() {
    return phone;
  }

  void setPhone(String phone) {
    this.phone = phone;
  }

  String getAddress() {
    return address;
  }

  void setAddress(String address) {
    this.address = address;
  }

  String getEmail() {
    return email;
  }

  void setEmail(String email) {
    this.email = email;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
    };
  }

  factory CustomerResource.fromMap(Map<String, dynamic> map) {
    return CustomerResource(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      address: map['address'] ?? '',

    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerResource.fromJson(String source) =>
      CustomerResource.fromMap(json.decode(source));

  factory CustomerResource.empty() {
    return CustomerResource(
      name: "",
      phone: "",
      email: "",
      address: "",
    );
  }
}

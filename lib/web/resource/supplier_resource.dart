import 'dart:convert';

class SupplierResource {
  String name;
  String phone;
  String email;
  String address;
  String type; // Service or Product

  SupplierResource({
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.type,
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

  String getType() {
    return type;
  }

  void setType(String type) {
    this.type = type;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
      'type': type,
    };
  }

  factory SupplierResource.fromMap(Map<String, dynamic> map) {
    return SupplierResource(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      address: map['address'] ?? '',
      type: map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SupplierResource.fromJson(String source) =>
      SupplierResource.fromMap(json.decode(source));

  factory SupplierResource.empty() {
    return SupplierResource(
      name: "",
      phone: "",
      email: "",
      address: "",
      type: "",
    );
  }

}

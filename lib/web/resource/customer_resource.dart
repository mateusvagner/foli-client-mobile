import 'dart:convert';

class CustomerResource {
  int id;
  String name;
  String phone;
  String email;
  String address;

  CustomerResource(
    this.id, {
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
  });

  int getId() {
    return id;
  }

  void setId(int id) {
    this.id = id;
  }

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
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
    };
  }

  factory CustomerResource.fromMap(Map<String, dynamic> map) {
    return CustomerResource(
      map['id'] ?? '',
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
      0,
      name: "",
      phone: "",
      email: "",
      address: "",
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerResource &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          phone == other.phone &&
          email == other.email &&
          address == other.address;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      phone.hashCode ^
      email.hashCode ^
      address.hashCode;
}

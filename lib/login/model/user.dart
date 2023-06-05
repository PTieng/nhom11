import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class User {
  int id;
  String password;
  String email;
  String name;
  String phone;
  String address;

  User({
    this.id = 0,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'password': password,
      'email': email,
      'name': name,
      'phone': phone,
      'address': address,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        name: map['name'],
        email: map['email'],
        password: map['password'],
        address: map['address'],
        phone: map['phone']);
  }

  toJosn() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
      "address": address,
    };
  }
}

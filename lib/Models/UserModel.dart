import 'package:flutter/foundation.dart';

class UserModel {
  String? fullName;
  String? email;
  String? phoneNo;
  String? password;
  String? shopName;
  String? shopAddressLat;
  String? shopAddressLong;
  String? roles_ID;

  UserModel({
    this.fullName,
    this.email,
    this.phoneNo,
    this.password,
    this.shopName,
    this.shopAddressLat,
    this.shopAddressLong,
    this.roles_ID,
  });
  factory UserModel.fromMap(map) {
    return UserModel(
        fullName: map['fullName'],
        email: map['email'],
        phoneNo: map['phoneNo'],
        password: map['password'],
        shopName: map['shopName'],
        shopAddressLat: map['shopAddressLat'],
        shopAddressLong: map['shopAddressLong'],
        roles_ID: map['roles_ID']);
  }
  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'phoneNo': phoneNo,
      'password': password,
      'shopName': shopName,
      'shopAddressLat': shopAddressLat,
      'shopAddressLong': shopAddressLong,
      'roles_ID': roles_ID,
    };
  }

  void fromMap(data) {}
}

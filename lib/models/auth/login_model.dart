// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String message;
  LoginModelData data;

  LoginModel({
    required this.message,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    message: json["message"],
    data: LoginModelData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
  };
}

class LoginModelData {
  String accessToken;
  int accessExpiry;
  String refreshToken;
  int refreshExpiry;
  LoginData data;

  LoginModelData({
    required this.accessToken,
    required this.accessExpiry,
    required this.refreshToken,
    required this.refreshExpiry,
    required this.data,
  });

  factory LoginModelData.fromJson(Map<String, dynamic> json) => LoginModelData(
    accessToken: json["accessToken"],
    accessExpiry: json["accessExpiry"],
    refreshToken: json["refreshToken"],
    refreshExpiry: json["refreshExpiry"],
    data: LoginData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "accessExpiry": accessExpiry,
    "refreshToken": refreshToken,
    "refreshExpiry": refreshExpiry,
    "data": data.toJson(),
  };
}

class LoginData {
  String id;
  String name;
  String email;

  LoginData({
    required this.id,
    required this.name,
    required this.email,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
  };
}

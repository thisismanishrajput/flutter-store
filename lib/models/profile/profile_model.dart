// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String message;
  Profile profile;

  ProfileModel({
    required this.message,
    required this.profile,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    message: json["message"],
    profile: Profile.fromJson(json["profile"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "profile": profile.toJson(),
  };
}

class Profile {
  String name;
  String email;
  int phone;
  bool isEmailVerified;

  Profile({
    required this.name,
    required this.email,
    required this.phone,
    required this.isEmailVerified,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    isEmailVerified: json["isEmailVerified"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "isEmailVerified": isEmailVerified,
  };
}

// To parse this JSON data, do
//
//     final brandModel = brandModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BrandModel brandModelFromJson(String str) => BrandModel.fromJson(json.decode(str));

String brandModelToJson(BrandModel data) => json.encode(data.toJson());

class BrandModel {
  String message;
  List<Brand> data;

  BrandModel({
    required this.message,
    required this.data,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
    message: json["message"],
    data: List<Brand>.from(json["data"].map((x) => Brand.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Brand {
  String id;
  String name;
  int v;

  Brand({
    required this.id,
    required this.name,
    required this.v,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["_id"],
    name: json["name"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "__v": v,
  };
}

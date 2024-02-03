
import 'dart:convert';

ProductModel brandModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String brandModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String message;
  List<Product> data;

  ProductModel({
    required this.message,
    required this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    message: json["message"],
    data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Product {
  ProductCategory productCategory;
  ProductBrand productBrand;
  String id;
  String title;
  String description;
  int price;
  List<String> imageUrls;
  int stockQuantity;
  List<Rating> ratings;
  int v;

  Product({
    required this.productCategory,
    required this.productBrand,
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrls,
    required this.stockQuantity,
    required this.ratings,
    required this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productCategory:json["productCategory"] == null ? ProductCategory(category: "", name: ""): ProductCategory.fromJson(json["productCategory"]),
    productBrand: json["productBrand"] == null ? ProductBrand(brand: "", name: ""):ProductBrand.fromJson(json["productBrand"]),
    id: json["_id"],
    title: json["title"] ?? "",
    description: json["description"] ?? "",
    price: json["price"],
    imageUrls: List<String>.from(json["imageUrls"].map((x) => x)),
    stockQuantity: json["stockQuantity"],
    ratings: List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "productCategory": productCategory.toJson(),
    "productBrand": productBrand.toJson(),
    "_id": id,
    "title": title,
    "description": description,
    "price": price,
    "imageUrls": List<dynamic>.from(imageUrls.map((x) => x)),
    "stockQuantity": stockQuantity,
    "ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
    "__v": v,
  };
}

class ProductBrand {
  String brand;
  String name;

  ProductBrand({
    required this.brand,
    required this.name,
  });

  factory ProductBrand.fromJson(Map<String, dynamic> json) => ProductBrand(
    brand: json["brand"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "brand": brand,
    "name": name,
  };
}

class ProductCategory {
  String category;
  String name;

  ProductCategory({
    required this.category,
    required this.name,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) => ProductCategory(
    category: json["category"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "name": name,
  };
}

class Rating {
  String user;
  int rating;
  String review;
  String id;
  DateTime date;

  Rating({
    required this.user,
    required this.rating,
    required this.review,
    required this.id,
    required this.date,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    user: json["user"],
    rating: json["rating"],
    review: json["review"],
    id: json["_id"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "rating": rating,
    "review": review,
    "_id": id,
    "date": date.toIso8601String(),
  };
}

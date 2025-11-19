// To parse this JSON data, do
//
//     final newsEntry = newsEntryFromJson(jsonString);

import 'dart:convert';

List<ProductsEntry> productsEntryFromJson(String str) =>
    List<ProductsEntry>.from(
      json.decode(str).map((x) => ProductsEntry.fromJson(x)),
    );

String productsEntryToJson(List<ProductsEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsEntry {
  String id;
  String name;
  int price;
  int quantity;
  String description;
  String? thumbnail;
  String category;
  bool isFeatured;
  int? userId;

  ProductsEntry({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.description,
    required this.thumbnail,
    required this.category,
    required this.isFeatured,
    required this.userId,
  });

  factory ProductsEntry.fromJson(Map<String, dynamic> json) => ProductsEntry(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    quantity: json["quantity"],
    description: json["description"],
    thumbnail: json["thumbnail"] ?? "",
    category: json["category"],
    isFeatured: json["is_featured"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "quantity": quantity,
    "description": description,
    "thumbnail": thumbnail,
    "category": category,
    "is_featured": isFeatured,
    "user_id": userId,
  };
}

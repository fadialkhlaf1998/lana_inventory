import 'package:meta/meta.dart';
import 'dart:convert';

class ProductDecoder {
  List<Product> products;

  ProductDecoder({
    required this.products,
  });

  factory ProductDecoder.fromJson(String str) => ProductDecoder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductDecoder.fromMap(Map<String, dynamic> json) => ProductDecoder(
    products: List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "products": List<dynamic>.from(products.map((x) => x.toMap())),
  };
}

class Product {
  int productId;
  String itemId;
  String barcode;
  String title;
  int qty;
  double vkNetto;
  double vkBrutto;
  double warenwertVkNetto;
  double warenwertVkBrutto;
  double ekNetto;
  double ekBrutto;
  double ekSummeNetto;
  double ekSummeBrutto;
  // DateTime createdAt;

  Product({
    required this.productId,
    required this.itemId,
    required this.barcode,
    required this.title,
    required this.qty,
    required this.vkNetto,
    required this.vkBrutto,
    required this.warenwertVkNetto,
    required this.warenwertVkBrutto,
    required this.ekNetto,
    required this.ekBrutto,
    required this.ekSummeNetto,
    required this.ekSummeBrutto,
    // required this.createdAt,
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    productId: json["product_id"],
    itemId: json["item_id"],
    barcode: json["barcode"],
    title: json["title"],
    qty: json["qty"],
    vkNetto: json["VK_netto"].toDouble(),
    vkBrutto: json["VK_brutto"].toDouble(),
    warenwertVkNetto: json["Warenwert_VK_netto"].toDouble(),
    warenwertVkBrutto: json["Warenwert_VK_brutto"].toDouble(),
    ekNetto: json["EK_netto"].toDouble(),
    ekBrutto: json["EK_brutto"].toDouble(),
    ekSummeNetto: json["EK_Summe_netto"].toDouble(),
    ekSummeBrutto: json["EK_Summe_brutto"].toDouble(),
    // createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toMap() => {
    "product_id": productId,
    "item_id": itemId,
    "barcode": barcode,
    "title": title,
    "qty": qty,
    "VK_netto": vkNetto,
    "VK_brutto": vkBrutto,
    "Warenwert_VK_netto": warenwertVkNetto,
    "Warenwert_VK_brutto": warenwertVkBrutto,
    "EK_netto": ekNetto,
    "EK_brutto": ekBrutto,
    "EK_Summe_netto": ekSummeNetto,
    "EK_Summe_brutto": ekSummeBrutto,
    // "created_at": createdAt.toIso8601String(),
  };
}

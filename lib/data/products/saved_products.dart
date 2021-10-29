import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hulk_store/data/products/products_data.dart';
import 'package:hulk_store/domain/products/product.dart';
import 'package:hulk_store/domain/products/product_repository.dart';

const products = '''''';

class ProductInMemoryRepository implements ProductRepository {
  @override
  Future<List<Product>> get() async {
    // final String response = await rootBundle.loadString('assets/sample.json');
    return Future.delayed(
        const Duration(seconds: 2), () => _parse(jsonDecode(products_data)));
  }

  List<Product> _parse(List<dynamic> json) {
    return json.map((jsonItem) => _parseProducts(jsonItem)).toList();
  }

  Product _parseProducts(Map<String, dynamic> json) {
    return Product(json['id'], json['image'], json['title'], json['price'], json['stock']);
  }
}

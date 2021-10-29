// import 'package:flutter/material.dart';
// import 'package:hulk_store/domain/products/product.dart';
// import 'package:hulk_store/file_manager.dart';
//
// class FileController extends ChangeNotifier {
//
//   Product _product;
//
//   Product get product => _product;
//
//   readProduct() async {
//     final result = await FileManager().readJsonFile();
//
//     if (result != null) {
//       _product = Product.fromJson(await FileManager().readJsonFile());
//     }
//
//     notifyListeners();
//   }
//
//   writeProduct() async {
//     _product = await FileManager().writeJsonFile();
//     notifyListeners();
//   }
//
// }
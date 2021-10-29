import 'package:hulk_store/domain/products/product.dart';

abstract class ProductRepository {
  Future<List<Product>> get();
}
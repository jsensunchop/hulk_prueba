import 'package:hulk_store/domain/products/product.dart';
import 'package:hulk_store/domain/products/product_repository.dart';

class GetProducts {
  final ProductRepository _productRepository;

  GetProducts(this._productRepository);

  Future<List<Product>> execute() {
    return _productRepository.get();
  }
}

import 'package:hulk_store/domain/products/get_products_use_case.dart';
import 'package:hulk_store/domain/products/product.dart';
import 'package:hulk_store/presentation/products/products_state.dart';
import 'package:intl/intl.dart';

class ProductsPresenter {
  final GetProducts _getProductsUseCase;

  ProductsPresenter(this._getProductsUseCase);

  Future<ProductsState> search(String searchTerm) {
    return _getProductsUseCase
        .execute()
        .then((products) => _mapToState(searchTerm, products));
  }

  ProductsState _mapToState(String searchTerm, List<Product> products) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'en-US');

    return ProductsState(
        searchTerm,
        products.map((product) => ProductItemState(product.id, product.image,
            product.title, formatCurrency.format(product.price), product.stock)).toList());
  }
}

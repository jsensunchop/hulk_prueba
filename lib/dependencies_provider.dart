import 'package:get_it/get_it.dart';
import 'package:hulk_store/data/card/saved_cart.dart';
import 'package:hulk_store/data/products/saved_products.dart';
import 'package:hulk_store/domain/cart/actions/add_product_to_cart.dart';
import 'package:hulk_store/domain/cart/actions/edit_quantity_cart_items.dart';
import 'package:hulk_store/domain/cart/actions/get_cart.dart';
import 'package:hulk_store/domain/cart/actions/remove_item.dart';
import 'package:hulk_store/domain/cart/cart_repository.dart';
import 'package:hulk_store/domain/products/get_products_use_case.dart';
import 'package:hulk_store/domain/products/product_repository.dart';
import 'package:hulk_store/presentation/cart/cart_presenter.dart';
import 'package:hulk_store/presentation/products/products_presenter.dart';

final getIt = GetIt.instance;

void init() {
  registerProductDependencies();
  registerCartDependencies();
}


void registerProductDependencies() {
  getIt.registerFactory(() => ProductsPresenter(getIt()));

  getIt.registerLazySingleton(() => GetProducts(getIt()));

  getIt.registerLazySingleton<ProductRepository>(() => ProductInMemoryRepository());
}

void registerCartDependencies() {
  getIt.registerFactory(() => CartPresenter(getIt(),getIt(),getIt(),getIt(),getIt()));

  getIt.registerLazySingleton(() => GetCart(getIt()));
  getIt.registerLazySingleton(() => AddProductToCart(getIt()));
  getIt.registerLazySingleton(() => RemoveItemFromCart(getIt()));
  getIt.registerLazySingleton(() => EditQuantityOfCartItem(getIt()));

  getIt.registerLazySingleton<CartRepository>(() => CartInMemoryRepository());
}
import 'package:hulk_store/domain/cart/cart.dart';
import 'package:hulk_store/domain/cart/cartItem.dart';
import 'package:hulk_store/domain/cart/cart_repository.dart';
import 'package:hulk_store/domain/products/product.dart';

class AddProductToCart {
  final CartRepository _cartRepository;

  AddProductToCart(this._cartRepository);

  Future<Cart> execute(Product product) async {
    final cart = await _cartRepository.get();

    final cartItem =
    CartItem(product.id, product.image, product.title, product.price, 1);

    final editedCart = cart.addItem(cartItem);

    await _cartRepository.save(editedCart);

    return editedCart;
  }
}
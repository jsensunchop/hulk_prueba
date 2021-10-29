import 'package:hulk_store/domain/cart/cart.dart';
import 'package:hulk_store/domain/cart/cartItem.dart';
import 'package:hulk_store/domain/cart/cart_repository.dart';

class RemoveItemFromCart {
  final CartRepository _cartRepository;

  RemoveItemFromCart(this._cartRepository);

  Future<Cart> execute(CartItem cartItem) async {
    final cart = await _cartRepository.get();

    final editedCart = cart.removeItem(cartItem);

    await _cartRepository.save(editedCart);

    return editedCart;
  }
}
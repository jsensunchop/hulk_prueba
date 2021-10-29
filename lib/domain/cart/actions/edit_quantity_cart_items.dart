import 'package:hulk_store/domain/cart/cart.dart';
import 'package:hulk_store/domain/cart/cartItem.dart';
import 'package:hulk_store/domain/cart/cart_repository.dart';

class EditQuantityOfCartItem {
  final CartRepository _cartRepository;

  EditQuantityOfCartItem(this._cartRepository);

  Future<Cart> execute(CartItem cartItem, int quantity) async {
    final cart = await _cartRepository.get();

    final editedCart = cart.editItem(cartItem, quantity);

    await _cartRepository.save(editedCart);

    return editedCart;
  }
}
import 'package:hulk_store/domain/cart/cart.dart';
import 'package:hulk_store/domain/cart/cart_repository.dart';

class GetCart {
  final CartRepository _cartRepository;

  GetCart(this._cartRepository);

  Future<Cart> execute() async {
    return _cartRepository.get();
  }
}
import 'package:flutter/material.dart';
import 'package:hulk_store/presentation/cart/cart_state.dart';
import 'package:hulk_store/presentation/cart/widgets/cart_item.dart';

class CartForm extends StatelessWidget {
  final CartState _cartState;
  final void Function(CartItemState cartItemState, int quantity)
  _editQuantityOfCartItemCallback;
  final void Function(CartItemState cartItemState) _removeItemFromCartCallback;

  const CartForm(this._cartState, this._editQuantityOfCartItemCallback,
      this._removeItemFromCartCallback);

  @override
  Widget build(BuildContext context) {
    final totalPrice = () => Column(children: <Widget>[
      const Divider(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            'total Price',

          ),
          Text(_cartState.totalPrice,
          )
        ],
      )
    ]);

    final cartItems = () => ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: _cartState.items.length + 1,
        itemBuilder: (context, index) {
          if (index < _cartState.items.length) {
            final CartItemState cartItemState = _cartState.items[index];

            return CartContentItem(cartItemState,
                _editQuantityOfCartItemCallback, _removeItemFromCartCallback);
          } else {
            return totalPrice();
          }
        });

    final emptyCartItems = () => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          ' Empty Cart :(',
        ));

    final content =
    _cartState.items.isNotEmpty ? cartItems() : emptyCartItems();

    return content;
  }
}
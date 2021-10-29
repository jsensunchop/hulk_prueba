import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hulk_store/data/products/products_data.dart';
import 'package:hulk_store/presentation/cart/cart_state.dart';
import 'package:hulk_store/presentation/cart/widgets/cart_form.dart';
import 'package:hulk_store/presentation/widgets/button.dart';
import 'package:hulk_store/style.dart';

class CartWidget extends StatelessWidget {
  final CartState _cartState;
  final void Function(CartItemState cartItemState, int quantity)
  _editQuantityOfCartItemCallback;
  final void Function(CartItemState cartItemState) _removeItemFromCartCallback;

   CartWidget(this._cartState, this._editQuantityOfCartItemCallback,
      this._removeItemFromCartCallback);



  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent
            ),
            height: 110,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: kPrimaryColor
              ),
                padding: EdgeInsets.zero,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.shopping_cart, color: Colors.white,),
                      Text(
                        'Cart',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                  onTap: () {},
                )),
          ),
          Expanded(
              child: CartForm(_cartState, _editQuantityOfCartItemCallback,
                  _removeItemFromCartCallback)),
        ],
      ),
    );
  }
}


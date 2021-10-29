import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hulk_store/data/products/products_data.dart';
import 'package:hulk_store/presentation/cart/cart_state.dart';
import 'package:hulk_store/presentation/cart/widgets/cart_form.dart';
import 'package:hulk_store/presentation/widgets/button.dart';

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
      child: Column(
        children: <Widget>[
          Container(
            height: 110,
            child: DrawerHeader(
                padding: EdgeInsets.zero,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.shopping_cart),
                      Text(
                        'Cart',
                      )
                    ],
                  ),
                  onTap: () {},
                )),
          ),
          Expanded(
              child: CartForm(_cartState, _editQuantityOfCartItemCallback,
                  _removeItemFromCartCallback)),
          SizedBox(
            width:  MediaQuery.of(context).size.width *0.4,
            child: Column(
              children: [
                Text(_cartState.items[0].quantity.toString()),
                // const BuyButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class BuyButton extends StatefulWidget {
//   const BuyButton({Key key}) : super(key: key);
//
//   @override
//   _BuyButtonState createState() => _BuyButtonState();
// }
//
// class _BuyButtonState extends State<BuyButton> {
//
//   dynamic data;
//   List _items= [];
//
//   Future<void> readJson() async {
//
//     // final String response = await rootBundle.loadString('assets/sample.json');
//     // await sharedPref.save("user", response);
//     // print(sharedPref);
//     print(products_data);
//
//     data = await json.decode(products_data);
//     print(data);
//     print("--------");
//     setState(() {
//       _items = data;
//     });
//
//
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     return AppButton(
//       text: "Buy",
//       press: () {
//         readJson();
//
//
//
//
//         // Navigator.pushNamed(context, SignInScreenAdmin.routeName);
//       },
//     );
//   }
// }

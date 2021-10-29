import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hulk_store/data/products/products_data.dart';
import 'package:hulk_store/presentation/cart/cart_state.dart';
import 'package:hulk_store/presentation/widgets/button.dart';
import 'package:hulk_store/style.dart';

class CartContentItem extends StatelessWidget {
  final CartItemState _cartItemState;
  final TextEditingController _quantityController = TextEditingController();
  final void Function(CartItemState cartItemState) _removeItemFromCartCallback;
  final void Function(CartItemState cartItemState, int quantity)
  _editQuantityOfCartItemCallback;

  CartContentItem(
      this._cartItemState,
      this._editQuantityOfCartItemCallback,
      this._removeItemFromCartCallback,
      );

  dynamic data;
  List _items= [];
  String data1= "";
  int id = 0;


  Future<void> readJson() async {

    // final String response = await rootBundle.loadString('assets/sample.json');
    // await sharedPref.save("user", response);
    // print(sharedPref);
    print(products_data);

    data = await json.decode(products_data);
    print(data);
    print("--------");

      _items = data;

    print(_items);
    print("---/////////////////////////////-----");
    id = int.parse(_cartItemState.id.toString())-1;
    print(id);
    print(_items[id]["stock"].toString());
    print(_items[id]["id"].toString());
    print(_items[id]["stock"].toString());
  }


  Future<void> changeStock(int index, int stock) async{
    // final String response = await rootBundle.loadString('assets/sample.json');
    // final data = await json.decode(response);
    // final data = await json.decode(products_data);
    _items[index]["stock"] = _items[index]["stock"] - stock;
    data1 = await json.encode(_items);
    products_data = data1;
    // data = await json.encode(value)
  }

  @override
  Widget build(BuildContext context) {
    _quantityController.text = _cartItemState.quantity.toString();

    _quantityController.addListener(() {
      final int quantity = int.tryParse(_quantityController.text) ?? 0;

      if (quantity != _cartItemState.quantity) {
        _editQuantityOfCartItemCallback(_cartItemState, quantity);
      }
    });

    final imageWidget = Image.network(
      _cartItemState.image,
      height: 120.0,
    );

    final descriptionWidget = Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text(
          _cartItemState.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),

      const SizedBox(height: 15,),
      Row(
        children: <Widget>[
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                          "Quantity: ",
                          // decoration: const InputDecoration(labelText: 'Quantity'),
                      ),
                      Text(
                        _quantityController.text,
                        style: const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
                        // decoration: const InputDecoration(labelText: 'Quantity'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text(_cartItemState.price,
                  )
                ],
              )
          ),
        ],
      ),
      SizedBox(height: 30,),
      Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: AppButton(
          text: "Buy",
          press: () async{
            readJson();

            print(int.parse(_cartItemState.id.toString()));
            // print(_items[7]["stock"].toString());


            // Navigator.pushNamed(context, SignInScreenAdmin.routeName);
          },
        ),
      )
    ]);

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 16.0, right: 8.0, bottom: 16.0),
                      child: imageWidget)),
              Expanded(flex: 3, child: descriptionWidget),
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: () => _removeItemFromCartCallback(_cartItemState),
              )
            ],
          ),
        ));
  }
}

// class BuyButton extends StatefulWidget {
//   final cartItemStateId;
//   const BuyButton( this.cartItemStateId, {Key key}) : super(key: key);
//
//   @override
//   _BuyButtonState createState() => _BuyButtonState();
// }
//
// class _BuyButtonState extends State<BuyButton> {
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return
//   }
// }

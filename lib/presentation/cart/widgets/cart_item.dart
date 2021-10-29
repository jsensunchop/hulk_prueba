import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hulk_store/data/products/products_data.dart';
import 'package:hulk_store/presentation/cart/cart_state.dart';
import 'package:hulk_store/presentation/cart/widgets/cart_finished.dart';
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
    data = await json.decode(products_data);
    _items = data;
    id = int.parse(_cartItemState.id.toString())-1;
    changeStock(id, int.parse(_quantityController.text));
  }


  Future<void> changeStock(int index, int stock) async{
    print(_items[index]["stock"]);
    if(_items[index]["stock"] >= int.parse(_quantityController.text)){
      print(_items[index]["stock"]);
      _removeItemFromCartCallback(_cartItemState);
      _items[index]["stock"] = _items[index]["stock"] - stock;
      data1 = await json.encode(_items);
      products_data = data1;
      print(products_data);
      // Navigator.pushNamed(context, CartFinished.routeName);
    } else{
      print("no se puede men");
    }
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
                      ),
                      Text(
                        _quantityController.text,
                        style: const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
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
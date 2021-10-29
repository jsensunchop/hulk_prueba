import 'package:flutter/material.dart';
import 'package:hulk_store/presentation/products/products_state.dart';


class ProductItem extends StatelessWidget {
  final ProductItemState _productItem;

  final void Function(ProductItemState productItemState) _addProductToCartCallback;

  const ProductItem(this._productItem, this._addProductToCartCallback);

  @override
  Widget build(BuildContext context) {

    if(_productItem.stock > 0){
      return Card(

          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Image.network(
                    _productItem.image,
                    fit: BoxFit.fitWidth,
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _productItem.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(_productItem.price, ),
              Text(_productItem.stock.toString(), ),


              RawMaterialButton(
                child: Text(
                  'Add to cart'.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                onPressed: () {
                  _addProductToCartCallback(_productItem);
                },
              )
            ],
          ));

    } else{
      return Card(

          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Image.network(
                    _productItem.image,
                    fit: BoxFit.fitWidth,
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _productItem.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(_productItem.price, ),
              Text(_productItem.stock.toString(), ),


              RawMaterialButton(
                child: Text(
                  'Not available'.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.grey),
                ),
                onPressed: () {


                  // _addProductToCartCallback(_productItem);

                },
              )
            ],
          ));
    }

  }
}
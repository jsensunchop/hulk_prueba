import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hulk_store/presentation/home/home_admin.dart';

class AddProductsAdmin extends StatelessWidget {

  static String routeName = "/add_products";
  const AddProductsAdmin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _productDetail = ModalRoute.of(context).settings.arguments
    as ProductArguments;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading:  Container(
                  width: 50,
                  height: 70,
                  child: Image.network(
                    _productDetail.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                title: Text(_productDetail.title),
                subtitle: Text(_productDetail.price),
                trailing: Text(_productDetail.stock),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hulk_store/data/products/products_data.dart';
import 'package:hulk_store/dependencies_provider.dart';
import 'package:hulk_store/presentation/cart/cart_presenter.dart';
import 'package:hulk_store/presentation/cart/cart_state.dart';
import 'package:hulk_store/presentation/cart/widgets/cart_form.dart';
import 'package:hulk_store/presentation/cart/widgets/cart_widget.dart';
import 'package:hulk_store/presentation/products/add_products.dart';
import 'package:hulk_store/presentation/products/products_state.dart';
import 'package:hulk_store/presentation/products/widgets/product_list.dart';
import 'package:hulk_store/sharedprefs.dart';
import 'package:hulk_store/size_config.dart';
import 'package:hulk_store/style.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenAdmin extends StatefulWidget {

  static String routeName = "/home_screen_admin";
  const HomeScreenAdmin({Key key}) : super(key: key);

  @override
  _HomeScreenAdminState createState() => _HomeScreenAdminState();
}

class _HomeScreenAdminState extends State<HomeScreenAdmin> {

  TextEditingController _textFieldController = TextEditingController();
  List _items = [];
  String data1= "";
  dynamic data;
  // SharedPref sharedPref = SharedPref();


  // Fetch content from the json file
  Future<void> readJson() async {
    


    // final String response = await rootBundle.loadString('assets/sample.json');
    // await sharedPref.save("user", response);
    // print(sharedPref);
    data = await json.decode(products_data);
    setState(() {
      _items = data;
    });
  }

  Future<void> changeStock(int index, int stock) async{
    // final String response = await rootBundle.loadString('assets/sample.json');
    // final data = await json.decode(response);
    // final data = await json.decode(products_data);
    _items[index]["stock"] = _items[index]["stock"] + stock;
    data1 = await json.encode(_items);
    products_data = data1;
    // data = await json.encode(value)
  }

  Future<void> _displayTextInputDialog(BuildContext context, int index ) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Increase stock'),
          content: TextField(
            controller: _textFieldController,
            // decoration: InputDecoration(hintText: "Text Field in Dialog"),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text('OK'),
              onPressed:(){

                changeStock(index, int.parse(_textFieldController.text));
                Navigator.pop(context);
              }
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _product = ModalRoute.of(context).settings.arguments as ProductArguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Admin',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [


            // Display the data loaded from sample.json
            _items.isNotEmpty
                ? Expanded(
              child: RefreshIndicator(
                onRefresh: readJson,
                child: ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        print("/////////////////////////////////$index");
                        _displayTextInputDialog(context, index);

                      },
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          leading:  Container(
                            width: 50,
                            height: 70,
                            child: Image.network(
                              _items[index]["image"],
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          title: Text(_items[index]["title"]),
                          subtitle: Text(_items[index]["price"].toString()),
                          trailing: Text(_items[index]["stock"].toString()),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
                : ElevatedButton(
                child: const Text('Load Data'),
                onPressed: readJson,
            ),
          ],
        ),
      ),
    );
  }
}

class ProductArguments {

  final String id;
  final String image;
  final String title;
  final String price;
  final String stock;

  ProductArguments(
      { this.id, this.image, this.title, this.price, this.stock});
}

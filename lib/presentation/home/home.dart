import 'package:flutter/material.dart';
import 'package:hulk_store/data/products/products_data.dart';
import 'package:hulk_store/dependencies_provider.dart';
import 'package:hulk_store/presentation/cart/cart_presenter.dart';
import 'package:hulk_store/presentation/cart/cart_state.dart';
import 'package:hulk_store/presentation/cart/widgets/cart_form.dart';
import 'package:hulk_store/presentation/cart/widgets/cart_widget.dart';
import 'package:hulk_store/presentation/products/products_state.dart';
import 'package:hulk_store/presentation/products/widgets/product_list.dart';
import 'package:hulk_store/size_config.dart';
import 'package:hulk_store/style.dart';

class HomeScreen extends StatefulWidget {

  static String routeName = "/home_screen";
  final CartPresenter _cartPresenter;

  HomeScreen() : _cartPresenter = getIt<CartPresenter>();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CartState _cartState;

  @override
  void initState() {
    super.initState();
    _cartState = CartState.createEmpty();

    widget._cartPresenter.init(updateState);
  }

  void updateState(CartState cartState) {
    setState(() {
      _cartState = cartState;
    });
  }

  void _addProductToCart(ProductItemState productItemState) {
    widget._cartPresenter.addProductToCartCart(productItemState);
  }

  void _removeItemFromCart(CartItemState cartItemState) {
    widget._cartPresenter.removeCartItemOfCart(cartItemState);
  }

  void _editQuantityOfCartItem(CartItemState cartItemState, int quantity) {
    widget._cartPresenter.editQuantityOfCartItem(cartItemState, quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(121, 178, 123, 1),
      appBar: HomeHeader(_cartState.totalItems),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ProductList(_addProductToCart),
      ),
      endDrawer:
      CartWidget(_cartState, _editQuantityOfCartItem, _removeItemFromCart),
    );
  }
}


class HomeHeader extends StatelessWidget implements PreferredSizeWidget {
  final int _cartItemsCounter;

  HomeHeader(this._cartItemsCounter, {Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; //

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: logout(context),
      backgroundColor: kPrimaryColor,
      actions: <Widget>[
        shoppingCartIcon(context),

      ],
    );
  }

  Widget logout(BuildContext context){
    return Stack(
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ))
      ],
    );
  }

  Widget shoppingCartIcon(BuildContext context) {
    final badge = _cartItemsCounter != 0 ? counterBadge() : Container();

    // Using Stack to show Notification Badge
    return Stack(
      children: <Widget>[
        IconButton(
          icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
          ),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
        badge
      ],
    );
  }

  Widget counterBadge() {
    return Positioned(
      right: 5,
      top: 5,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        constraints: const BoxConstraints(
          minWidth: 18,
          minHeight: 18,
        ),
        child: Text(
          '$_cartItemsCounter',
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

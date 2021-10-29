import 'package:flutter/material.dart';
import 'package:hulk_store/presentation/home/home.dart';
import 'package:hulk_store/presentation/widgets/button.dart';

class CartFinished extends StatelessWidget {

  static String routeName = "/cart_finished";
  const CartFinished({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text(""),
            AppButton(
              text: "Back to Home",
              press: (){
                Navigator.pushNamed(context, HomeScreen.routeName);
            },
            )
          ],
        ),
      ),
    );
  }
}

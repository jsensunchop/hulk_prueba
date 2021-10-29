import 'package:flutter/material.dart';
import 'package:hulk_store/presentation/home/home.dart';
import 'package:hulk_store/presentation/widgets/button.dart';
import 'package:hulk_store/style.dart';

class CartFinished extends StatelessWidget {

  static String routeName = "/cart_finished";
  const CartFinished({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 111,
              height: 111,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: const Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 60,
                ),
              ),
            ),
            const Text(
              "Great!",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 80.0, left: 80.0),
              child: AppButton(
                text: "Back to Home",
                press: (){
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

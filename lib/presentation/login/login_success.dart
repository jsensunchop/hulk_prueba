import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hulk_store/presentation/home/home.dart';
import 'package:hulk_store/presentation/login/login.dart';
import 'package:hulk_store/presentation/login/login_admin.dart';
import 'package:hulk_store/presentation/widgets/button.dart';
import 'package:hulk_store/size_config.dart';

class LoginTypeScreen extends StatelessWidget {
  static String routeName = "/login_type";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Success"),
      ),
      body: Center(child: Body()),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: MediaQuery.of(context).size.height *0.04),
        // Image.asset(
        //   "assets/images/success.png",
        //   height:  MediaQuery.of(context).size.height *0.04, //40%
        // ),
        SizedBox(height: MediaQuery.of(context).size.height *0.08),
        const Text(
          "Please pick up your role",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width:  MediaQuery.of(context).size.width *0.6,
          child: AppButton(
            text: "Admin",
            press: () {
              Navigator.pushNamed(context, SignInScreenAdmin.routeName);
            },
          ),
        ),
        Spacer(),
        SizedBox(
          width:  MediaQuery.of(context).size.width *0.6,
          child: AppButton(
            text: "User",
            press: () {
              Navigator.pushNamed(context, SignInScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:hulk_store/dependencies_provider.dart' as di;
import 'package:hulk_store/domain/controller/file_controller.dart';
import 'package:hulk_store/presentation/home.dart';
import 'package:hulk_store/presentation/login/login.dart';
import 'package:hulk_store/presentation/login/login_success.dart';
import 'package:hulk_store/presentation/register/register.dart';
import 'package:provider/provider.dart';




void main() {
  di.init();
  runApp(
      // MultiProvider(
        // providers: [ChangeNotifierProvider(create: (_) => FileController())],
        // child:
        MyApp(),
      // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // context.read<FileController>().readProduct();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Color.fromRGBO(12, 117, 16, 1),
      ),
      initialRoute: LoginTypeScreen.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        SignInScreen.routeName: (context) => SignInScreen(),

        LoginTypeScreen.routeName: (context) => LoginTypeScreen(),
        // ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
        // SignUpScreen.routeName: (context) => SignUpScreen(),
        // CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
        // OtpScreen.routeName: (context) => OtpScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        // DetailsScreen.routeName: (context) => DetailsScreen(),
        // CartScreen.routeName: (context) => CartScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        // ProfileScreen.routeName: (context) => ProfileScreen(),
      }
    );
  }
}


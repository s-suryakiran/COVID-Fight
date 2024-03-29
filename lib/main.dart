import 'constants.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'signup.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid Fight',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Comfortaa",
          textTheme: TextTheme(
            bodyText1: TextStyle(color: kBodyTextColor),
          )),
     // home:HomeScreen(),
    home:SignupPage(),
    );
  }
}

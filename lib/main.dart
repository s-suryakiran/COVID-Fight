import 'package:CovidFight/status_updation.dart';
import 'home.dart';
import 'constants.dart';
//import 'counter.dart';
//import 'header.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//import 'status_updation.dart';
import 'home_screen.dart';
import 'register.dart';
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
      home: Register(),
//      home:HomeScreen(),
//    home: StatusUpdation(),
//        routes: {
//        '/chatbot':(context) => Chatbot(),
//        },
    );
  }
}

import 'package:flutter/cupertino.dart';

import 'constants.dart';
import 'counter.dart';
import 'header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.deepPurple,
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.deepPurple[800],
                ),
                padding: EdgeInsets.all(15),
//                alignment: Alignment.topLeft,
                child: Center(
                  child: SafeArea(
                    child: Text(
                      "Covid-19",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,

                        fontFamily: "Monoton",
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.topLeft,
                child: Text(
                  "Are you feeling sick?",
                  style: kTitleTextstyle.copyWith(color: Color(0xfff3e6ff),fontSize: 20,letterSpacing: 1)
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}

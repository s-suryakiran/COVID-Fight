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
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Covid-19",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      letterSpacing: 3
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Are you feeling sick?",
                    style: kTitleTextstyle.copyWith(color: Color(0xfff3e6ff))
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}

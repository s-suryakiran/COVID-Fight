import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'constants.dart';
import 'counter.dart';
import 'header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'animated_bar.dart';


class HomeScreen extends StatefulWidget {
  final List<BarItem> barItems = [
    BarItem(
      text: "Home",
      iconData: FontAwesomeIcons.home,
      color: Colors.indigo,
    ),
    BarItem(
      text: "Covid Status",
      iconData: FontAwesomeIcons.chartBar,
      color: Colors.pinkAccent,
    ),
//    BarItem(
//      text: "Search",
//      iconData: Icons.search,
//      color: Colors.yellow.shade900,
//    ),
    BarItem(
      text: "Profile",
      iconData: Icons.person_outline,
      color: Colors.teal,
    ),
  ];

  @override
  _HomeScreenState createState() =>
      _HomeScreenState();
}class _HomeScreenState
    extends State<HomeScreen> {
  int selectedBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: AnimatedBottomBar(
            barItems: widget.barItems,
            animationDuration: const Duration(milliseconds: 150),
            barStyle: BarStyle(
                fontSize: 20.0,
                iconSize: 30.0
            ),
            onBarTap: (index) {
              setState(() {
                selectedBarIndex = index;
              });
            }),
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.deepPurple,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.deepPurple[800],
                  ),
                  padding: EdgeInsets.all(15),
//                alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.only(top: 40),
                    child: Center(
                      child: Text(
                        "Covid-19",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: "Monoton",
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.topLeft,
                  child: Text("Are you feeling sick?",
                      style: kTitleTextstyle.copyWith(
                          color: Color(0xfff3e6ff),
                          fontSize: 18,
                          letterSpacing: 1)),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Colors.red,
                          onPressed: () async {
                            const url = "tel:+911123978046";
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.phoneAlt,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Call ",
                                      style: kTitleTextstyle.copyWith(
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "Now",
                                      style: kTitleTextstyle.copyWith(
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RaisedButton(
                          color: Colors.blue,
                          //TODO: 1.Self Diagnosis page
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.stethoscope,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Self ",
                                      style: kTitleTextstyle.copyWith(
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "Diagnosis",
                                      style: kTitleTextstyle.copyWith(
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                "Prevention",
                style: kTextStyle,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
//            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/wash.png",
                      ),
                      Text("Wash hands"),
                      Text("frequently")
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/mask.jpg",
                      ),
                      Text("Wear"),
                      Text("Masks")
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/socialdistance.jpeg",
                      ),
                      Text("Social"),
                      Text("Distancing")
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                "Symptoms",
                style: kTextStyle,
              )),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
//            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/caugh.png",
                      ),
                      Text("Cough"),

                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/fever.png",
                      ),
                      Text("Fever"),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/headache.png",
                      ),
                      Text("Headache"),

                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

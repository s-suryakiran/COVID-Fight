import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'constants.dart';
import 'counter.dart';
import 'header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'animated_bar.dart';
import 'chatbot_chat.dart';
import 'placeholder_widget.dart';
import 'status_updation.dart';
import 'home.dart';
import 'info_screen.dart';

class HomeScreen extends StatefulWidget {
  final List<BarItem> barItems = [
    BarItem(
      text: "Home",
      iconData: Icons.home,
      color: Colors.indigo,
    ),
    BarItem(
      text: "Covid Status",
      iconData: Icons.insert_chart,
      color: Colors.pinkAccent,
    ),
    BarItem(
      text: "Health Tips",
      iconData: Icons.beenhere,
      color: Colors.green,
    ),
//    BarItem(
//      text: "Profile",
//      iconData: Icons.person_outline,
//      color: Colors.teal,
//    ),
  ];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedBarIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(widget: Home()),
    PlaceholderWidget(widget: StatusUpdation()),
    PlaceholderWidget(widget: InfoScreen(),)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[selectedBarIndex],
      floatingActionButton: FloatingActionButton(
        heroTag: "button1",
        onPressed: () {
          return Navigator.push(
              context, MaterialPageRoute(builder: (context) => Chatbot()));
        },
        child: Icon(Icons.message),
      ),
      bottomNavigationBar: AnimatedBottomBar(
          barItems: widget.barItems,
          animationDuration: const Duration(milliseconds: 150),
          barStyle: BarStyle(fontSize: 20.0, iconSize: 30.0),
          onBarTap: (index) {
            setState(() {
              selectedBarIndex = index;
            });
          }),
    );
  }
}

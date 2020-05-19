import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main (){
  runApp(MaterialApp(home: Scaffold(
    
    appBar: AppBar(
      title: Text('Covid Fight'),
      backgroundColor: Colors.red,
    ),
    body: CovidFight(),
  ),));
}

class CovidFight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
          child: Icon(Icons.message),

      ),
    );
  }
}

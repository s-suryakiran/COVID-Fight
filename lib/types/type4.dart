import 'package:flutter/material.dart';
import '../selfDiagnosis/self_diagnosis_brain.dart';
import 'package:flutter/foundation.dart';
import 'package:CovidFight/home_screen.dart';

List<String> answers = [];
String result;

class Type4 extends StatefulWidget {
  Type4({
    @required this.questionNumber,
    @required this.question,
    @required this.str,
    @required this.brain,
    Key key,
  }) : super(key: key);
  final String question;
  final List<String> str;
  final int questionNumber;
  final StoryBrain brain;
  @override
  _Type4State createState() => _Type4State();
}

class _Type4State extends State<Type4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.str[0],
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                StoryBrain storybrain = new StoryBrain();
                storybrain.lead = false;
                storybrain.stopFlag = false;
              });

              print(widget.str[0]);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: Text(
              "FINISH",
              style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 3,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.teal[500],
          )
        ],
      ),
    );
  }
}

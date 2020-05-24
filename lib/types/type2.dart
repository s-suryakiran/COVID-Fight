import 'package:flutter/material.dart';
import '../self_diagnosis_brain.dart';
import '../self_diagnosis.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:flutter/foundation.dart';
import 'type3.dart';
import 'type1.dart';
import 'type4.dart';

List<String> answers = [];
String result;

class Type2 extends StatefulWidget {
  Type2({
    @required this.questionNumber,
    @required this.question,
    @required this.str,
    @required this.brain,
    Key key,
  }) : super(key: key);
  final StoryBrain brain;
  final String question;
  final List<String> str;
  final int questionNumber;

  @override
  _Type2State createState() => _Type2State();
}

class _Type2State extends State<Type2> {
  String _option;

  List<Widget> createRadioList() {
    List<Widget> widgets = [];
    widgets.add(Expanded(
      flex: 4,
      child: Center(
        child: Text(
          widget.question,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    ));

    for (String Str in widget.str) {

      widgets.add(Expanded(
        child: RadioListTile(
          title: Text(Str),
          value: Str,
          groupValue: _option,
          onChanged: (value) {
            setState(() {
              _option = value;
            });
            result = value;
          },
        ),
      ));
    }
    widgets.add(Expanded(child: SizedBox()));
    widgets.add(Expanded(
      child: RaisedButton(
        onPressed: () {
          //TODO:IMPLEMENT NAV PUSH
          print(result);
          int q = widget.str.indexOf(result);
          q = widget.brain.nextStory(q.toString(), widget.questionNumber);
          print(q);
          int type = widget.brain.getQuestionType(q);
          print(type);
          if (type == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Type1(
                          questionNumber: q,
                          question: widget.brain.getQuestion(q),
                          str: widget.brain.getOptions(q),
                          brain: widget.brain,
                        )));
          } else if (type == 2) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Type2(
                          questionNumber: q,
                          question: widget.brain.getQuestion(q),
                          str: widget.brain.getOptions(q),
                          brain: widget.brain,
                        )));
          } else if (type == 3) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Type3(
                          questionNumber: q,
                          question: widget.brain.getQuestion(q),
                          str: widget.brain.getOptions(q),
                          brain: widget.brain,
                        )));
          } else if (type == 4) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Type4(
                          questionNumber: q,
                          question: widget.brain.getQuestion(q),
                          str: widget.brain.getOptions(q),
                          brain: widget.brain,
                        )));
          }
        },
        child: Text(
          "NEXT",
          style: TextStyle(
              fontSize: 20,
              letterSpacing: 3,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.blue[500],
      ),
    ));
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("Self-Diagnosis"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: createRadioList(),
        ),
      ),
    );
  }
}

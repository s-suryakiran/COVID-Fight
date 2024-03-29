import 'package:flutter/material.dart';
import '../selfDiagnosis/self_diagnosis_brain.dart';
import 'package:flutter/foundation.dart';
import 'type3.dart';
import 'type2.dart';
import 'type4.dart';

List<String> answers = [];
String result='1';

class Type1 extends StatefulWidget {
  Type1({
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
  _Type1State createState() => _Type1State();
}

class _Type1State extends State<Type1> {
  int currentQuestion = 3;
  int nextQuestion;
  TypeOne _option = TypeOne.no;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Self-Diagnosis"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blue[100],
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Center(
                child: Text(
                  widget.question,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                child: ListTile(
                  title: const Text(
                    'Yes',
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: Radio(
                    value: TypeOne.yes,
                    groupValue: _option,
                    onChanged: (TypeOne value) {
                      setState(() {
                        _option = value;
                        result = '0';
                      });

                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                child: ListTile(
                  title: const Text('No', style: TextStyle(fontSize: 20)),
                  leading: Radio(
                    value: TypeOne.no,
                    groupValue: _option,
                    onChanged: (TypeOne value) {
                      setState(() {
                        _option = value;
                        result = '1';
                      });

                    },
                  ),
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            Expanded(
              child: RaisedButton(
                onPressed: () {
                  print(result);

                  int q = widget.brain.nextStory(result, widget.questionNumber);
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.blue[500],
              ),
            )
          ],
        ),
      ),
    );
  }
}

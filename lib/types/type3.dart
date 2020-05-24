import 'package:flutter/material.dart';
import '../selfDiagnosis/self_diagnosis_brain.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:flutter/foundation.dart';
import 'type2.dart';
import 'type1.dart';
import 'type4.dart';

enum TypeOne { yes, no }
List<String> answers = [];
String result;

class Type3 extends StatelessWidget {
  Type3(
      {@required this.questionNumber,
      @required this.question,
      @required this.str,
      @required this.brain});
  final StoryBrain brain;
  final String question;
  final List<String> str;
  final int questionNumber;

  List<Widget> createRadioList(BuildContext context, answers) {
    List<Widget> widgets = [];
    widgets.add(SizedBox(height: 40));
    widgets.add(
      Center(
        child: Text(
          question,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
    widgets.add(SizedBox(height: 20));
    widgets.add(CheckboxGroup(
      labels: str,
      onChange: (bool isChecked, String label, int index) {
        if (isChecked) {
          print(index);
          answers.add(index.toString());
        } else {
          if (answers.contains(index.toString()))
            answers.remove(index.toString());
        }
      },
    ));
    widgets.add(SizedBox(height: 20));

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.purple[100],
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("Self-Diagnosis"),
//        backgroundColor: Colors.purple,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Column(
                children: createRadioList(context, answers),
              ),
          ButtonTheme(
            minWidth: double.infinity,
            height: 60,

            child: RaisedButton(

              onPressed: () {
                print("printing age value insdie type3");
                print(brain.age);

                //TODO:SHOULD I SORT
                if (listEquals(answers, []))
                  result = '-1';

                else{
                result=null;
                result = answers.join();}
                int q = brain.nextStory(result, questionNumber);
                answers=[];
                result = null;
                print(q);
                int type = brain.getQuestionType(q);
                print(type);
                if (type == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Type1(
                            questionNumber: q,
                            question: brain.getQuestion(q),
                            str: brain.getOptions(q),
                            brain: brain,
                          )));
                } else if (type == 2) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Type2(
                            questionNumber: q,
                            question: brain.getQuestion(q),
                            str: brain.getOptions(q),
                            brain: brain,
                          )));
                } else if (type == 3) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Type3(
                            questionNumber: q,
                            question: brain.getQuestion(q),
                            str: brain.getOptions(q),
                            brain: brain,
                          )));
                } else if (type == 4) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Type4(
                            questionNumber: q,
                            question: brain.getQuestion(q),
                            str: brain.getOptions(q),
                            brain: brain,
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
          )
            ],
          ),
        ),
      ),
    );
  }
}

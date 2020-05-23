import 'package:flutter/material.dart';
import '../self_diagnosis_brain.dart';
import '../self_diagnosis.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:flutter/foundation.dart';
import 'type2.dart';
import 'type1.dart';
import 'type4.dart';

StoryBrain brain = StoryBrain();
enum TypeOne { yes, no }
/*
class Type1 extends StatefulWidget {
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
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.purple[100],
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
                  storyBrain.getQuestion(currentQuestion),
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
                  //TODO:next question
                  List<int> answer = [];
                  if(_option == TypeOne.no)
                    answer.add(1);
                  else
                    answer.add(0);
                  setState(() {
                    nextQuestion = storyBrain.nextStory(answer,currentQuestion);
                    currentQuestion = nextQuestion;
                  });
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
                color: Colors.purple[500],
              ),
            )
          ],
        ),
      ),
    );
  }
}
*/
/*
class Type2 extends StatefulWidget {
  @override
  _Type2State createState() => _Type2State();
}

class _Type2State extends State<Type2> {
  List<String> str;
  String _option;

  List<Widget> createRadioList() {
    List<Widget> widgets = [];
    widgets.add(Expanded(
      flex: 6,
      child: Center(
        child: Text(
          storyBrain.getQuestion(),
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    ));
    for (String Str in str) {
      widgets.add(Expanded(
        child: RadioListTile(
          title: Text(Str),
          value: Str,
          groupValue: _option,
          onChanged: (value) {
            setState(() {
              _option = value;
              print(_option);
            });
          },
        ),
      ));
    }
    widgets.add(Expanded(child: SizedBox()));
        widgets.add(Expanded(
          child: RaisedButton(
            onPressed: () {
              setState(() {
                storyBrain.nextStory();
                storyBrain.getQuestion();
              });
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
            color: Colors.purple[500],
          ),
        ));
    return widgets;
  }

  @override
  void initState() {
    // TODO: implement initState
    str = storyBrain.getOptions();
    _option = str.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: Text("Self-Diagnosis"),
        backgroundColor: Colors.purple,
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

 */
List<String> answers = [];
String result;

class Type3 extends StatelessWidget {
  Type3(
      {@required this.questionNumber,
      @required this.question,
      @required this.str});
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
    widgets.add(ButtonTheme(
      minWidth: double.infinity,
      height: 60,
      child: RaisedButton(
        onPressed: () {

          //TODO:SHOULD I SORT
          if (listEquals(answers, []))
            result = '-1';
          else
            result = answers.join();
          int q = brain.nextStory(result, questionNumber);
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
                        )));
          } else if (type == 2) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Type2(
                          questionNumber: q,
                          question: brain.getQuestion(q),
                          str: brain.getOptions(q),
                        )));
          } else if (type == 3) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Type3(
                          questionNumber: q,
                          question: brain.getQuestion(q),
                          str: brain.getOptions(q),
                        )));
          } else if (type == 4) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Type4(
                          questionNumber: q,
                          question: brain.getQuestion(q),
                          str: brain.getOptions(q),
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
        color: Colors.purple[500],
      ),
    ));
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: Text("Self-Diagnosis"),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: createRadioList(context, answers),
          ),
        ),
      ),
    );
  }
}

/*
class Type3 extends StatefulWidget {
  Type3({@required this.question});
  final String question;

  @override
  _Type3State createState() => _Type3State();
}

class _Type3State extends State<Type3> {
  List<String> str;
  String _option;
  bool checked=false;

  List<Widget> createRadioList() {
    List<Widget> widgets = [];
    widgets.add(SizedBox(height:40));
    widgets.add(Center(
      child: Text(
        question,
        //storyBrain.getQuestion(),
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    ),);
    widgets.add(SizedBox(height:20));
      widgets.add(CheckboxGroup(
        labels: str,
        onChange:(bool isChecked,String label,int index) {
print(index);
        },
        onSelected: (List<String> checked,)=>print(checked),
      ));

    widgets.add(SizedBox(height:20));
    widgets.add(ButtonTheme(
      minWidth: double.infinity,
      height: 60,
      child: RaisedButton(

        onPressed: () {
          setState(() {
//            storyBrain.nextStory();
//            storyBrain.getQuestion();
          });
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
        color: Colors.purple[500],
      ),
    ));
    return widgets;
  }

  @override
  void initState() {
    // TODO: implement initState
//    str = storyBrain.getOptions();
    _option = str.first;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: Text("Self-Diagnosis"),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(

            children: createRadioList(question),
          ),
        ),
      ),
    );
  }
} */
/*
class Type4 extends StatefulWidget {
  @override
  _Type4State createState() => _Type4State();
}

class _Type4State extends State<Type4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Result"),backgroundColor: Colors.purple,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(storyBrain.getResult(),style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: () {
              //TODO:next question
            },
            child: Text(
              "FINISH",
              style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 3,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)),
            color: Colors.purple[500],
          )

        ],
      ),
    );
  }
}
*/

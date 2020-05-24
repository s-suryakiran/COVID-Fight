import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'self_diagnosis_brain.dart';
import '../types/type3.dart';


const kBottomContainerHeight1 = 80.0;
const kReusableCardColor1 = Color(0xFF1d1e33);
var kInactiveCardColor1 = Colors.blue[200];
const kBottomContainerColor1 = Color(0xFFEB1555);
const kActiveCardColor1 = Color(0xFF111238);
const kTextStyle1 = TextStyle(fontSize: 18, color: Colors.white);
const kNumberTextStyle1 = TextStyle(fontSize: 50, fontWeight: FontWeight.w900);
int age;
enum gender { male, female }
gender selectedGender;

class SelfDiagnosisHome extends StatefulWidget {
  @override
  _SelfDiagnosisHomeState createState() => _SelfDiagnosisHomeState();
}

class _SelfDiagnosisHomeState extends State<SelfDiagnosisHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Self Diagnosis"),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
Expanded(child: SizedBox(),),
                Expanded(
                  child: Container(
                      child: Text(
                    "Select Gender",
                    style: TextStyle(color: Colors.grey,
                        fontSize: 25, fontWeight: FontWeight.bold),
                  )),
                ),

                Expanded(
                  flex: 4,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: reusableCard(
                          onPress: () {
                            setState(() {
                              selectedGender = gender.male;
                            });
                          },
                          color: selectedGender == gender.male
                              ? kActiveCardColor1
                              : kInactiveCardColor1,
                          cardChild: IconContent(
                            icon: FontAwesomeIcons.mars,
                            text: "MALE",
                          ),
                        ),
                      ),
                      Expanded(
                        child: reusableCard(
                            onPress: () {
                              setState(() {
                                selectedGender = gender.female;
                              });
                            },
                            color: selectedGender == gender.female
                                ? kActiveCardColor1
                                : kInactiveCardColor1,
                            cardChild: IconContent(
                                icon: FontAwesomeIcons.venus, text: "FEMALE")),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(

                  ),
                ),
                Expanded(
                  child: Container(
                      child: Text(
                    "Enter age",
                    style: TextStyle(color: Colors.grey,
                        fontSize: 25, fontWeight: FontWeight.bold),
                  )),
                ),

                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      age = int.parse(value);
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                ),
                Expanded(child: SizedBox()),
                ButtonTheme(
                  minWidth: double.infinity,
                  height: 60,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {


                        StoryBrain brain = new StoryBrain(age:age);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Type3(
                                      questionNumber: 1,
                                      question: brain.getQuestion(1),
                                      str: brain.getOptions(1),
                                      brain: brain,
                                    )));
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
                    color: Colors.blue[500],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class reusableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  Function onPress;
  reusableCard({@required this.color, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
      ),
    );
  }
}

class IconContent extends StatelessWidget {
  final IconData icon;
  final String text;

  IconContent({this.icon, this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(text, style: kTextStyle1),
      ],
    );
  }
}

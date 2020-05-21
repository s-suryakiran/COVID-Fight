import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
const kBottomContainerHeight1 = 80.0;
const kReusableCardColor1 = Color(0xFF1d1e33);
const kInactiveCardColor1 = Color(0xFFb3c4ff);
const kBottomContainerColor1 = Color(0xFFEB1555);
const kActiveCardColor1 = Color(0xFF111238);
const kTextStyle1=TextStyle(fontSize: 18,color: Color(0xFF8d8e98));
const kNumberTextStyle1=TextStyle(fontSize: 50,fontWeight: FontWeight.w900);
String age;
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

      body:SafeArea(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(


            children: <Widget>[

              Row(
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
                      cardChild:
                      IconContent(icon:FontAwesomeIcons.mars, text: "MALE",),
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
            SizedBox(
              height: 20,
            ),
            Container(child: Text("Enter age",style: kTextStyle1.copyWith(fontSize: 20,fontWeight: FontWeight.bold),)),
              SizedBox(
                height: 20,
              ),
              TextField(

                onChanged: (value) {
                  age = value;
                },
                decoration: InputDecoration(

                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
            ],
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
  reusableCard({@required this.color, this.cardChild,this.onPress});

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
        Text(
            text,
            style: kTextStyle1
        ),
      ],
    );
  }
}
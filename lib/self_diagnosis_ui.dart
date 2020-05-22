import 'package:flutter/material.dart';
import 'self_diagnosis_brain.dart';
import 'self_diagnosis.dart';
bool checkValue=false;
StoryBrain storyBrain = new StoryBrain();
enum TypeOne { yes, no }
class Type1 extends StatefulWidget {
  @override
  _Type1State createState() => _Type1State();
}

class _Type1State extends State<Type1> {
  TypeOne _option = TypeOne.no;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Self-Diagnosis"),backgroundColor: Colors.purple,),
      backgroundColor: Colors.purple[100],
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              flex: 6,


              child: Center(child:Text(
                storyBrain.getQuestion(),
                style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),),

            Expanded(

              child: Container(
                alignment: Alignment.topLeft,
                child: ListTile(
                  title: const Text('Yes',style: TextStyle(fontSize: 20),),
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
                  title: const Text('No',style: TextStyle(fontSize: 20)),
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
            Expanded(

                child: SizedBox()
            ),
Expanded(
  child: RaisedButton(
    onPressed: (){
      //TODO:next question
    },
    child: Text("NEXT",style: TextStyle(fontSize: 20,letterSpacing: 3,color: Colors.white,fontWeight: FontWeight.bold),),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    color: Colors.purple[500],
    ),

)
          ],
        ),
      ),
    );
  }
}
class Type2 extends StatefulWidget {
  @override
  _Type2State createState() => _Type2State();
}

class _Type2State extends State<Type2> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

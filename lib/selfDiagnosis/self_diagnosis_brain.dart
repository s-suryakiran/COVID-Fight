import 'self_diagnosis.dart';
class StoryBrain {
  StoryBrain({this.age});
  bool stopFlag = false, lead = false;
  final int age;
  int fever=0;

  //type 1=> yes or no
  //type 2=> single choice selection
  //type 3=> multiple choice selection
  //type 4=>result

  List<SelfDiagnosis> _questions = [
    SelfDiagnosis(type: 1, questionTitle: 'Please check atleast one answer'),

//    1
    SelfDiagnosis(
      type: 3,
      questionTitle: 'Please check all statements that apply to you. ',
      choice1: 'Current cancer',
      choice2: 'Diseases or drugs that weaken\nimmune system',
      choice4: 'Long-term stay at care facility or\nnursing home',
      choice3: 'Obesity',
    ),
//    2
    SelfDiagnosis(
        type: 3,
        questionTitle: 'Please check all statements that apply to you.',
        choice1: 'Diabetes',
        choice2: 'Cardiovascular disease',
        choice3: 'History of chronic lung disease',
        choice4: 'History of chronic liver disease',
        choice5: 'History of chronic kidney disease'),
    //3
    SelfDiagnosis(
        type: 3,
        questionTitle:
            'Do you have any of the following symptoms? Please select symptoms that are not related to any chronic disease you may be subject to:',
        choice1: 'Fever',
        choice2: 'Cough',
        choice3: 'Shortness of breath'),
    //4
    SelfDiagnosis(
        type: 3,
        questionTitle: 'Do you have any of the following symptoms?',
        choice1: 'Fatigue',
        choice2: 'Muscle pain',
        choice3: 'Chills',
        choice4: 'Headache',
        choice5: 'Diarrhea',
        choice6: 'Nausea',
        choice7: 'Sore Throat',
        choice8: 'Impaired taste or smell'),
//5
    SelfDiagnosis(
        type: 2,
        questionTitle:
            'Have you had close contact with a person with confirmed or probable COVID-19 in the past 14 days?',
        choice1:
            'I have provided direct care to such a person without the use of protective mask or gloves',
        choice2: 'I had a direct physical contact with such a person',
        choice3:
            'I had face to face contact with such a person within 1 meter for longer than 15 minutes',
        choice4: 'None of the above',
        choice5: 'Other type of contact'),
//6
    SelfDiagnosis(
        type: 2,
        questionTitle:
            'Have you had close contact with a person with confirmed or probable COVID-19 in the past 14 days?',
        choice1:
            'I have provided direct care to such aperson without the use of protective mask or gloves',
        choice2: 'I had a direct physical contact with such a person',
        choice3:
            'I had face to face contact with such a person within 1 meter for longer than 15 minutes',
        choice4: 'None of the above',
        choice5: 'Other type of contact'),
    //7
    //TODO
    SelfDiagnosis(
      type: 4,
      questionTitle: 'Result',
      choice1: 'Quarantine',
    ),
    //8
//TODO
    SelfDiagnosis(
      type: 4,
      questionTitle: 'Result',
      choice1: 'Stay home and monitor your symptoms',
    ),
    //9
//TODO
    SelfDiagnosis(
      type: 4,
      questionTitle: 'Result',
      choice1: 'Quarantine',
    ),
    //10
    //TODO
    SelfDiagnosis(
      type: 4,
      questionTitle: 'Result',
      choice1: 'Follow preventive measures',
    ),
    //11
    SelfDiagnosis(
      type: 2,
      questionTitle: 'How high is your fever?',
      choice1: 'Between 37.5 °C and 38 °C(99.5 °F and 100.4 °F)',
      choice2: 'Between 38 °C and 40 °C(100.4 °F and 104.7 °F)',
      choice3: 'Greater than 40 °C(104 °F)',
      choice4: 'I haven\' taken my temperature',
    ),
    //12
    SelfDiagnosis(
      type: 1,
      questionTitle: 'Are your symptoms worsening rapidly?',
      choice1: 'Yes',
      choice2: 'No',
    ),
    //13
    SelfDiagnosis(
      type: 1,
      questionTitle: 'Are you breathing very fast?',
      choice1: 'Yes',
      choice2: 'No',
    ),
    //14
    SelfDiagnosis(
      type: 1,
      questionTitle: 'Are you coughing a blood?',
      choice1: 'Yes',
      choice2: 'No',
    ),
    //15
    SelfDiagnosis(
        type: 3,
        questionTitle: 'Do you have any of the following symptoms?',
        choice1: 'Fatigue',
        choice2: 'Muscle pain',
        choice3: 'Chills',
        choice4: 'Headache',
        choice5: 'Diarrhea',
        choice6: 'Nausea',
        choice7: 'Sore Throat',
        choice8: 'Impaired taste or smell'),
    //16
    SelfDiagnosis(
      type: 1,
      questionTitle:
          'Have you traveled or resided in the country of local, widespread transmission of corona virus?',
      choice1: 'Yes',
      choice2: 'No',
    ),
    //17
    SelfDiagnosis(
        type: 2,
        questionTitle:
            'Have you had close contact with a person with confirmed or probable COVID-19 in the past 14 days?',
        choice1:
            'I have provided direct care to such aperson without the use of protective mask or gloves',
        choice2: 'I had a direct physical contact with such a person',
        choice3:
            'I had face to face contact with such a person within 1 meter for longer than 15 minutes',
        choice4: 'None of the above',
        choice5: 'Other type of contact'),
    //18
    //TODO
    SelfDiagnosis(
        type: 4,
        questionTitle: 'Result',
        choice1: 'Avoid all contacts.Consult health department.'),
    //19
    //TODO
    SelfDiagnosis(type: 4, questionTitle: 'Result', choice1: 'Call Doctor as soon as possible.'),
    //20
    //TODO
    SelfDiagnosis(
        type: 4,
        questionTitle: 'Result',
        choice1: 'Avoid all contacts.Consult health department.'),
    //21
    SelfDiagnosis(
      type: 1,
      questionTitle:
          'Have you traveled or resided in the country of local, widespread transmission of corona virus?',
      choice1: 'Yes',
      choice2: 'No',
    ),
    //22
    SelfDiagnosis(
        type: 2,
        questionTitle:
            'Have you had close contact with a person with confirmed or probable COVID-19 in the past 14 days?',
        choice1:
            'I have provided direct care to such aperson without the use of protective mask or gloves',
        choice2: 'I had a direct physical contact with such a person',
        choice3:
            'I had face to face contact with such a person within 1 meter for longer than 15 minutes',
        choice4: 'None of the above',
        choice5: 'Other type of contact'),
    //23
    //TODO
    SelfDiagnosis(
        type: 4,
        questionTitle: 'Result',
        choice1: 'Avoid all contacts.Consult health department.'),
    //24
    //TODO
    SelfDiagnosis(
        type: 4,
        questionTitle: 'Result',
        choice1: 'Stay home and monitor your symptoms.'),
    //25
    //TODO
    SelfDiagnosis(type: 4, questionTitle: 'Result', choice1: 'Call Doctor as soon as possible..'),
    //26
    SelfDiagnosis(
      type: 2,
      questionTitle: 'How high is your fever?',
      choice1: 'Between 37.5 °C and 38 °C(99.5 °F and 100.4 °F)',
      choice2: 'Between 38 °C and 40 °C(100.4 °F and 104.7 °F)',
      choice3: 'Greater than 40 °C(104 °F)',
      choice4: 'I haven\' taken my temperature',
    ),
    //27
    SelfDiagnosis(
      type: 1,
      questionTitle: 'Are your symptoms worsening rapidly?',
      choice1: 'Yes',
      choice2: 'No',
    ),
    //28
    SelfDiagnosis(
      type: 1,
      questionTitle: 'Are you breathing very fast?',
      choice1: 'Yes',
      choice2: 'No',
    ),
    //29
    SelfDiagnosis(
      type: 1,
      questionTitle: 'Are you coughing a blood?',
      choice1: 'Yes',
      choice2: 'No',
    ),
    //30
    //TODO
    SelfDiagnosis(
        type: 4,
        questionTitle: 'Result',
        choice1: 'Call Emergency number.Avoid all contacts.'),
    //31
    SelfDiagnosis(
      type: 2,
      questionTitle: 'How high is your fever?',
      choice1: 'Between 37.5 °C and 38 °C(99.5 °F and 100.4 °F)',
      choice2: 'Between 38 °C and 40 °C(100.4 °F and 104.7 °F)',
      choice3: 'Greater than 40 °C(104 °F)',
      choice4: 'I haven\' taken my temperature',
    ),
    //32
    SelfDiagnosis(
      type: 1,
      questionTitle: 'Are your symptoms worsening rapidly?',
      choice1: 'Yes',
      choice2: 'No',
    ),
    //33
    SelfDiagnosis(
      type: 1,
      questionTitle: 'Are you breathing very fast?',
      choice1: 'Yes',
      choice2: 'No',
    ),
    //34
    SelfDiagnosis(
      type: 1,
      questionTitle: 'Are you coughing a blood?',
      choice1: 'Yes',
      choice2: 'No',
    ),
    //35
    SelfDiagnosis(
        type: 3,
        questionTitle: 'Do you have any of the following symptoms?',
        choice1: 'Fatigue',
        choice2: 'Muscle pain',
        choice3: 'Chills',
        choice4: 'Headache',
        choice5: 'Diarrhea',
        choice6: 'Nausea',
        choice7: 'Sore Throat',
        choice8: 'Impaired taste or smell'),
    //36
    SelfDiagnosis(
        type: 2,
        questionTitle:
            'Have you had close contact with a person with confirmed or probable COVID-19 in the past 14 days?',
        choice1:
            'I have provided direct care to such aperson without the use of protective mask or gloves',
        choice2: 'I had a direct physical contact with such a person',
        choice3:
            'I had face to face contact with such a person within 1 meter for longer than 15 minutes',
        choice4: 'None of the above',
        choice5: 'Other type of contact'),
    //37
    //TODO
    SelfDiagnosis(
        type: 4,
        questionTitle: 'Result',
        choice1: 'Avoid all contacts.Consult health department.'),
    //38
    //TODO
    SelfDiagnosis(
        type: 4,
        questionTitle: 'Result',
        choice1: 'Call Emergency number.Avoid all contacts.'),
    //39
    //TODO
    SelfDiagnosis(
        type: 4,
        questionTitle: 'Result',
        choice1: 'Stay home and monitor your symptoms.'),
    //40
    //TODO
    SelfDiagnosis(type: 4, questionTitle: 'Result', choice1: 'Call Doctor as soon as possible..'),
    //41
    SelfDiagnosis(
        type: 2,
        questionTitle:
            'Have you had close contact with a person with confirmed or probable COVID-19 in the past 14 days?',
        choice1:
            'I have provided direct care to such aperson without the use of protective mask or gloves',
        choice2: 'I had a direct physical contact with such a person',
        choice3:
            'I had face to face contact with such a person within 1 meter for longer than 15 minutes',
        choice4: 'None of the above',
        choice5: 'Other type of contact'),
    //42
    //TODO
    SelfDiagnosis(
        type: 4,
        questionTitle: 'Result',
        choice1: 'Avoid all contacts.Consult health department.'),
    //43
    //TODO
    SelfDiagnosis(
        type: 4,
        questionTitle: 'Result',
        choice1: 'Call Emergency number.Avoid all contacts.'),
    //44
    //TODO
    SelfDiagnosis(
        type: 4,
        questionTitle: 'Result',
        choice1: 'Stay home and monitor your symptoms.'),
    //45
    //TODO
    SelfDiagnosis(type: 4, questionTitle: 'Result', choice1: 'Call Doctor as soon as possible..'),
    //46
    SelfDiagnosis(
      type: 1,
      questionTitle: 'Are your symptoms worsening rapidly?',
      choice1: 'Yes',
      choice2: 'No',
    ),
    //47
    SelfDiagnosis(
      type: 1,
      questionTitle: 'Are you breathing very fast?',
      choice1: 'Yes',
      choice2: 'No',
    ),
    //48
    SelfDiagnosis(
      type: 1,
      questionTitle: 'Are you coughing a blood?',
      choice1: 'Yes',
      choice2: 'No',
    ),
    //49
    SelfDiagnosis(
        type: 3,
        questionTitle: 'Do you have any of the following symptoms?',
        choice1: 'Fatigue',
        choice2: 'Muscle pain',
        choice3: 'Chills',
        choice4: 'Headache',
        choice5: 'Diarrhea',
        choice6: 'Nausea',
        choice7: 'Sore Throat',
        choice8: 'Impaired taste or smell'),
    //50
    SelfDiagnosis(
        type: 2,
        questionTitle:
            'Have you had close contact with a person with confirmed or probable COVID-19 in the past 14 days?',
        choice1:
            'I have provided direct care to such aperson without the use of protective mask or gloves',
        choice2: 'I had a direct physical contact with such a person',
        choice3:
            'I had face to face contact with such a person within 1 meter for longer than 15 minutes',
        choice4: 'None of the above',
        choice5: 'Other type of contact'),
    //51
    //TODO
    SelfDiagnosis(
        type: 4,
        questionTitle: 'Result',
        choice1: 'Avoid all contacts.Consult health department.'),
    //52
    //TODO
    SelfDiagnosis(
        type: 4,
        questionTitle: 'Result',
        choice1: 'Call Emergency number.Avoid all contacts.'),
    //53
    //TODO
    SelfDiagnosis(type: 4, questionTitle: 'Result', choice1: 'Call Doctor as soon as possible..'),
    //54
    //TODO
    SelfDiagnosis(
        type: 4,
        questionTitle: 'Result',
        choice1: 'Call Emergency number.Avoid all contacts.'),
    //55
    SelfDiagnosis(
        type: 2,
        questionTitle:
            'Have you had close contact with a person with confirmed or probable COVID-19 in the past 14 days?',
        choice1:
            'I have provided direct care to such aperson without the use of protective mask or gloves',
        choice2: 'I had a direct physical contact with such a person',
        choice3:
            'I had face to face contact with such a person within 1 meter for longer than 15 minutes',
        choice4: 'None of the above',
        choice5: 'Other type of contact'),
    //56
    //TODO
    SelfDiagnosis(
        type: 4,
        questionTitle: 'Result',
        choice1: 'Avoid all contacts.Consult health department.'),
    //57
    //TODO
    SelfDiagnosis(type: 4, questionTitle: 'Result', choice1: 'Call Doctor as soon as possible..'),
  ];

  int getQuestionType(int currentQuestion) {
    return _questions[currentQuestion].type;
  }

  int nextStory(String answer, int currentQuestion) {
    print(answer);
    print(currentQuestion);
    int nextQuestion = 0;
    switch (currentQuestion) {
      case 1:
        {
print("hi$age");
          nextQuestion = 2;
        }
        break;
      case 2:
        {
          nextQuestion = 3;
        }
        break;
      case 3:
        {
          print("enteres case 3");
          switch (answer) {
            case '-1':
              nextQuestion = 4;
              break;
            case '01':
              nextQuestion = 11;
              break;
            case '0':
              nextQuestion = 31;
              break;
            case '1':
              nextQuestion = 32;
              break;
            default:
              {
                print("entered default");
                if (!answer.contains('0') &&
                    answer.contains('2')) //TODO: CHECK 2ND CODN
                  nextQuestion = 46;
                else if (answer == '02' || answer == '012') {
                  nextQuestion = 26;
                  print("entered correct if");
                  print(nextQuestion);
                }
              }
          }
        }
        break;

      case 4:
        {
          if (answer == '-1' || answer == '0')
            nextQuestion = 5;
          //TODO please check
          else
            nextQuestion = 6;
        }
        break;

      case 5:
        {
          if (answer == '0' || answer == '1' || answer == '2') {
            nextQuestion = 9;
            stopFlag = true;
          }

          if (answer == '3' || answer == '4') {
            nextQuestion = 10;
            stopFlag = true;
          }
        }
        break;

      case 6:
        {
          if (answer == '0' || answer == '1' || answer == '2') {
            nextQuestion = 7;
            stopFlag = true;
          }

          if (answer == '3' || answer == '4') {
            nextQuestion = 8;
            stopFlag = true;
          }
        }
        break;

      case 11:
        {
          lead = false;
          if (answer=='2') {
            lead = true;
            fever = 45;
          } else
            fever = 30;
          nextQuestion = 12;
        }
        break;
      case 12:
        {
          if (answer == '0') //if yes
            lead = true;
          nextQuestion = 13;
        }
        break;
      case 13:
        {
          if (answer == '0') //if yes
            lead = true;
          nextQuestion = 14;
        }
        break;
      case 14:
        {
          if (answer == '0') //if yes
            lead = true;
          if (lead == true)
            nextQuestion = 30;
          else
            nextQuestion = 15;
        }
        break;
      case 15:
        {
          if (answer == '-1' || answer == '0')
            nextQuestion = 21;
          //TODO please check
          else
            nextQuestion = 16;
        }
        break;

      case 16:
        {
          nextQuestion = (answer == '1') ? 17 : 20;
          if (nextQuestion == 20) stopFlag = true;
        }
        break;

      case 21:
        {
          nextQuestion = (answer == '1') ? 22 : 20;
          if (nextQuestion == 20) stopFlag = true;
        }
        break;

      case 17:
        {
          if (answer == '0' || answer == '1' || answer == '2') {
            nextQuestion = 18;
            stopFlag = true;
          }

          if (answer == '3' || answer == '4') {
            nextQuestion = 19;
            stopFlag = true;
          }
        }
        break;

      case 22:
        {
          if (answer == '0' || answer == '1' || answer == '2') {
            nextQuestion = 23;
            stopFlag = true;
          }
          if (answer == '3' || answer == '4') {
            if ((lead == true || age > 65)) {
              nextQuestion = 25;
              //TODO:check
              stopFlag = true;
              lead = false;
            } else {
              nextQuestion = 24;
              stopFlag = true;
              lead = false;
            }
          }
        }

        break;

      case 26:
        {
          if (answer.contains('2'))
            fever = 45;
          else
            fever = 35;
          nextQuestion = 27;
        }
        break;
      case 27:
        nextQuestion = 28;
        break;
      case 28:
        nextQuestion = 29;
        break;
      case 29:
        {
          nextQuestion = 30;
          stopFlag = true;
        }
        break;
//      TODO:HANDLE 31,32,33,34
      case 31:
        {
          if (answer.contains('2'))
            fever = 45;
          else
            fever = 35;
          nextQuestion = 32;
        }
        break;
      case 32:
        {
          if (answer == '0') //if yes
            lead = true;
          nextQuestion = 33;
        }
        break;
      case 33:
        {
          if (answer == '0') //if yes
            lead = true;
          nextQuestion = 34;
        }
        break;
      case 34:
        {
          //TODO: CHECK FLOW .. HERE FEVER IS NOT CONSIDERED AT ALL
          if (answer == '0') //if yes
            lead = true;
          if (lead == true)
            nextQuestion = 30;
          else
            nextQuestion = 35;
        }
        break;
      case 35:
        {
          if (answer == '-1' || answer == '0')
            nextQuestion = 41;
          //TODO please check
          else
            nextQuestion = 36;
        }
        break;

      case 36:
        {
          if (answer == '0' || answer == '1' || answer == '2') {
            if (fever <= 40) {
              nextQuestion = 37;
              stopFlag = true;
            } else {
              nextQuestion = 38;
              stopFlag = true;
            }
          }
          if (answer == '3' || answer == '4') {
            if (fever <= 40 || age < 65 || lead == false) {
              nextQuestion = 39;
              lead = false;
              stopFlag = true;
            } else {
              nextQuestion = 40;
              lead = false;
              stopFlag = true;
            }
          }
        }
        break;

      case 41:
        {
          if (answer == '0' || answer == '1' || answer == '2') {
            if (fever <= 40)
              nextQuestion = 42;
            else
              nextQuestion = 43;
            stopFlag = true;
          }

          if (answer == '3' || answer == '4') {
            if (fever <= 40)
              nextQuestion = 44;
            else
              nextQuestion = 45;
            stopFlag = true;
          }
          break;
        }
        break;

      case 46:
        {
          if (answer == '0') lead = true;
          nextQuestion = 47;
        }
        break;
      case 47:
        {
          if (answer == '0') lead = true;
          nextQuestion = 48;
        }
        break;
      case 48:
        {
          if (lead) {
            nextQuestion = 54;
            stopFlag = true;
          } else
            nextQuestion = 49;
        }
        break;

      case 49:
        {
          if (answer == '-1' || answer == '0')
            nextQuestion = 55;
          //TODO please check
          else
            nextQuestion = 50;
        }
        break;

      case 50:
        {
          if (answer == '0' || answer == '1' || answer == '2') {
            if (age <= 65 || lead == false)
              nextQuestion = 51;
            else
              nextQuestion = 52;
            stopFlag = true;
          }

          if (answer == '3' || answer == '4') {
            nextQuestion = 53;
            stopFlag = true;
          }
          lead = false;
        }
        break;

      case 55:
        {
          if (answer == '0' || answer == '1' || answer == '2') {
            nextQuestion = 56;
            stopFlag = true;
          }

          if (answer == '3' || answer == '4') {
            nextQuestion = 57;
            stopFlag = true;
          }
        }
        break;
    } //switch ends
    answer=null;
    return nextQuestion;
  } //function ends

  String getQuestion(int currentQuestion) {
    return _questions[currentQuestion].questionTitle;
  }

  List<String> getOptions(int currentQuestion) {
    List<String> options = new List();
    if (_questions[currentQuestion].choice1 != null)
      options.add(_questions[currentQuestion].choice1);
    if (_questions[currentQuestion].choice2 != null)
      options.add(_questions[currentQuestion].choice2);
    if (_questions[currentQuestion].choice3 != null)
      options.add(_questions[currentQuestion].choice3);
    if (_questions[currentQuestion].choice4 != null)
      options.add(_questions[currentQuestion].choice4);
    if (_questions[currentQuestion].choice5 != null)
      options.add(_questions[currentQuestion].choice5);
    if (_questions[currentQuestion].choice6 != null)
      options.add(_questions[currentQuestion].choice6);
    if (_questions[currentQuestion].choice7 != null)
      options.add(_questions[currentQuestion].choice7);
    if (_questions[currentQuestion].choice8 != null)
      options.add(_questions[currentQuestion].choice8);
    return options;
  }

  String getResult() {
    return _questions[7].choice1;
  }
}

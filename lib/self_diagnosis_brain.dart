import 'self_diagnosis.dart';

class StoryBrain {
  List<int> answer;
  int currentQuestion;
  int nextQuestion;
  bool redFlag,stopFlag=false,lead = false;
  int age;

  //type 1=> yes or no
  //type 2=> single choice selection
  //type 3=> multiple choice selection
  //type 4=>result

  List<SelfDiagnosis> _questions = [
//    1
    SelfDiagnosis(
        type: 3,
        questionTitle: 'Please check all statements that apply to you. ',
        choice1: 'Current cancer',
        choice2: 'Diseases or drugs that weaken immune system',
        choice3: 'Obesity',
        choice4: 'Long-term stay at care facility or nursing home'),
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
    SelfDiagnosis(type: 4, questionTitle: 'Result', choice1: 'Call Doctor'),
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
    SelfDiagnosis(type: 4, questionTitle: 'Result', choice1: 'Call Doctor.'),
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
    SelfDiagnosis(type: 4, questionTitle: 'Result', choice1: 'Call Doctor.'),
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
    SelfDiagnosis(type: 4, questionTitle: 'Result', choice1: 'Call Doctor.'),
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
    SelfDiagnosis(type: 4, questionTitle: 'Result', choice1: 'Call Doctor.'),
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
    SelfDiagnosis(type: 4, questionTitle: 'Result', choice1: 'Call Doctor.'),

  ];

  void nextStory() {

    switch (currentQuestion) {
      case 3:
        {
          switch (answer) {
            case [-1]:
             nextQuestion = 4;
              break;
            case [0, 1]:
              nextQuestion = 11;
              break;
            case [0]:
              nextQuestion = 31;
              break;
            case [1]:
              nextQuestion=32;
              break;
            default:
              {
                if (!answer.contains(0) && answer==[2])
                  nextQuestion = 46;
                else if (answer==[0,2] || answer==[0,1,2])
                  nextQuestion = 26;
              }
          }
        }break;

      case 4:{
        if(answer.contains(7))
          redFlag=true;
        if(answer==[-1] || answer==[0])
          nextQuestion =5;
        //TODO please check
        else if(!answer.contains(0))
          nextQuestion = 6;
      }break;

      case 5:{
        switch(answer){
          case [0]:
          case[1]:
          case[2]:{
            nextQuestion=9;
            redFlag = true;
            stopFlag = true;
        }break;
          case[3]:
          case[4]:{
            nextQuestion=10;
            stopFlag=true;
          }break;
        }
      }break;

      case 6:{
        switch(answer){
          case [0]:
          case[1]:
          case[2]:{
            nextQuestion=7;
            redFlag = true;
            stopFlag = true;
          }break;
          case[3]:
          case[4]:{
            nextQuestion=8;
            stopFlag=true;
          }break;
        }
      }break;

//      TODO: handle questions 11,12,13,14
      case 15:{
        if(answer.contains(7))
          redFlag=true;
        if(answer==[-1] || answer==[0])
          nextQuestion =21;
        //TODO please check
        else if(!answer.contains(0))
          nextQuestion = 16;
      }break;

      case 16:{
        nextQuestion = (answer==[1])?20:17;
        if(nextQuestion==20)
          stopFlag=true;
      }break;

      case 21:{
        nextQuestion = (answer==[1])?20:22;
        if(nextQuestion==20)
          stopFlag=true;
      }break;

      case 17:{
        switch(answer){
          case [0]:
          case[1]:
          case[2]:{
            nextQuestion=18;
            redFlag = true;
            stopFlag = true;
          }break;
          case[3]:
          case[4]:{
            nextQuestion=19;
            stopFlag=true;
          }break;
        }
      }break;

      case 22:{
        switch(answer){
          case [0]:
          case[1]:
          case[2]:{
            nextQuestion=23;
            redFlag = true;
            stopFlag = true;
          }break;
          case[3]:
          case[4]:{
            nextQuestion=24;
            if(!(redFlag==true && age>65))
              stopFlag = true;
          }break;
        }
      }break;
      case 24:{
        nextQuestion = 25;
        stopFlag=true;
      }break;

    }//switch ends
  }//function ends


}

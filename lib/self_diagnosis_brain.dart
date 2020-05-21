import 'self_diagnosis.dart';

class StoryBrain {
  int _symptomNumber = 0;
  List<SelfDiagnosis> _storyData = [
    SelfDiagnosis(
        id: 1,
        questionTitle: 'Select your gender',
        choice1: 'Male',
        choice2: 'Female'),
    SelfDiagnosis(
        id: 2,
        questionTitle: 'How old are you?',
        choice1: 'Yes',
        choice2: 'No'),
    SelfDiagnosis(
        id: 3,
        questionTitle: 'Please select all the statements that apply to you',
        choice1: 'Current Cancer',
        choice2:
            'Do you have diseases or do you take drugs that weaken your immune system',
        choice3: 'Obesity',
        choice4: 'Long-term stay at a care facility or nursing home'),
    SelfDiagnosis(
        id: 4,
        questionTitle: 'Please select all the statements that apply to you',
        choice1: 'Diabetes',
        choice2: 'Cardiovascular disease',
        choice3: 'History of chronic lung disease',
        choice4: 'History of chronic liver disease',
        choice5: 'History of chronic kidney disease'),
    SelfDiagnosis(
        id: 5,
        questionTitle:
            'Do you have any of the followig symptoms? Please select symptoms that are not related to any chronic disease you may be subject to:',
        choice1: 'Fever',
        choice2: 'Cough',
        choice3: 'Shortness of breath'),

    SelfDiagnosis(
        id: 6,
        questionTitle: '',
        choice1: '',
        choice2: '',
        choice3: '',
        choice4: '',
        choice5: ''),

    SelfDiagnosis(
        id: 7,
        questionTitle: '',
        choice1: '',
        choice2: '',
        choice3: '',
        choice4: '',
        choice5: ''),

    SelfDiagnosis(
        id: 8,
        questionTitle: '',
        choice1: '',
        choice2: '',
        choice3: '',
        choice4: '',
        choice5: ''),

    SelfDiagnosis(
        id: 9,
        questionTitle: '',
        choice1: '',
        choice2: '',
        choice3: '',
        choice4: '',
        choice5: ''),

    SelfDiagnosis(
        id: 10,
        questionTitle: '',
        choice1: '',
        choice2: '',
        choice3: '',
        choice4: '',
        choice5: ''),

    SelfDiagnosis(
        id: 11,
        questionTitle: '',
        choice1: '',
        choice2: '',
        choice3: '',
        choice4: '',
        choice5: ''),

    SelfDiagnosis(
        id: 12,
        questionTitle: '',
        choice1: '',
        choice2: '',
        choice3: '',
        choice4: '',
        choice5: ''),
    SelfDiagnosis(
        id: 13,
        questionTitle: '',
        choice1: '',
        choice2: '',
        choice3: '',
        choice4: '',
        choice5: ''),
    SelfDiagnosis(
        id: 14,
        questionTitle: '',
        choice1: '',
        choice2: '',
        choice3: '',
        choice4: '',
        choice5: ''),
    SelfDiagnosis(
        id: 15,
        questionTitle: '',
        choice1: '',
        choice2: '',
        choice3: '',
        choice4: '',
        choice5: ''),
    SelfDiagnosis(
        id: 16,
        questionTitle: '',
        choice1: '',
        choice2: '',
        choice3: '',
        choice4: '',
        choice5: ''),
    SelfDiagnosis(
        id: 17,
        questionTitle: '',
        choice1: '',
        choice2: '',
        choice3: '',
        choice4: '',
        choice5: ''),
    SelfDiagnosis(
        id: 18,
        questionTitle: '',
        choice1: '',
        choice2: '',
        choice3: '',
        choice4: '',
        choice5: ''),
    SelfDiagnosis(
        id: 19,
        questionTitle: '',
        choice1: '',
        choice2: '',
        choice3: '',
        choice4: '',
        choice5: ''),
    SelfDiagnosis(
        id: 20,
        questionTitle: '',
        choice1: '',
        choice2: '',
        choice3: '',
        choice4: '',
        choice5: ''),

//    Story(
//        storyTitle:
//        'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
//        choice1: 'Restart',
//        choice2: '')
  ];
  String getStory() {
    return _storyData[_symptomNumber].questionTitle;
  }

  String getChoice1() {
    return _storyData[_symptomNumber].choice1;
  }

  String getChoice2() {
    return _storyData[_symptomNumber].choice2;
  }

  void nextStory(int choiceNumber) {
    if (choiceNumber == 1 && _symptomNumber == 0)
      _symptomNumber = 2;
    else if (choiceNumber == 2 && _symptomNumber == 0)
      _symptomNumber = 1;
    else if (choiceNumber == 1 && _symptomNumber == 1)
      _symptomNumber = 2;
    else if (choiceNumber == 2 && _symptomNumber == 1)
      _symptomNumber = 3;
    else if (choiceNumber == 1 && _symptomNumber == 2)
      _symptomNumber = 5;
    else if (choiceNumber == 2 && _symptomNumber == 2)
      _symptomNumber = 4;
    else
      restart();
  }

  void restart() {
    _symptomNumber = 0;
  }

  bool buttonShouldBeVisible() {
    if (_symptomNumber == 0 || _symptomNumber == 1 || _symptomNumber == 2)
      return true;
    else
      return false;
  }
}

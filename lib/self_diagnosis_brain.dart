import 'self_diagnosis.dart';
class StoryBrain {

  int _symptomNumber=0;
  List<SelfDiagnosis> _storyData = [
    //0
    SelfDiagnosis(
        questionTitle:
        'Have you been within 6 feet of a person with a lab-confirmed case of COVID-19 for at least 5 minutes, or had direct contact with their mucus or saliva, in the past 14 days?',
        choice1: 'Yes',
        choice2: 'No'),
    //1
    SelfDiagnosis(
        questionTitle:
        'Does the person with COVID-19 live with you?',
        choice1: 'Yes',
        choice2: 'No'),
    //2
    SelfDiagnosis(
        questionTitle:
        'In the last 48 hours, have you had any of the following NEW symptoms?',
        choice1: '< 2 years',
        choice2: '>= 2 years'),
    //3
    SelfDiagnosis(
        questionTitle:
        'Are they experiencing any of the following life- threatening symptoms?\n* Not experiencing any life-threatening symptoms *Extremely fast or shallow breathing *Blue-colored lips or face \n*Not waking up or not interacting when awake\n*So irritable that the child does not want to be held *Seizures',
        choice1: 'Yes to any',
        choice2: 'None of the above'),
    //4
    SelfDiagnosis(
        questionTitle:
        'Are you (they) experiencing any of the following life- threatening symptoms?\n* Not experiencing any life-threatening symptoms\n* Blue-colored lips or face\n* Severe and constant pain or pressure in the chest * Severe and constant dizziness or lightheadedness * Acting confused (new or worsening)\n* Unconscious or very difficult to wake up\n* Slurred speech (new or worsening)\n* New seizure or seizures that won’t stop',
        choice1: 'Yes',
        choice2: 'None of the above'),
    //5
    SelfDiagnosis(
        questionTitle:
        'Do you (they) have any of the following?\n* Coughing up blood (more than about 1 teaspoon)\n* Signs of low blood pressure (too weak to stand, light- headed, feeling cold, pale, clammy skin)\n*Ribs are pulling in with each breath (retractions) *Dehydration',
        choice1: 'Yes to any',
        choice2: 'None of the above'),
    //6
    SelfDiagnosis(
        questionTitle:
        ' Do you (they) have any of the following?\n* Coughing up blood (more than about 1 teaspoon)\n* Signs of low blood pressure (too weak to stand, light-headed, feeling cold, pale, clammy skin)',
        choice1: 'Yes to any',
        choice2: 'None of the above'),
    //7
    SelfDiagnosis(
        questionTitle:
        'In the two weeks before you (they) felt sick, did you (they): * Have contact with someone diagnosed with COVID-19\n * Live in or visit a place where COVID-19 is spreading',
        choice1: 'Yes',
        choice2: 'No'),
    //8


    
//    Story(
//        storyTitle:
//        'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
//        choice1: 'Restart',
//        choice2: '')
  ];
  String getStory(){
    return _storyData[_symptomNumber].questionTitle;
  }


  String getChoice1(){
    return _storyData[_symptomNumber].choice1;
  }
  String getChoice2(){
    return _storyData[_symptomNumber].choice2;
  }

  void nextStory(int choiceNumber){
    if(choiceNumber==1&&_symptomNumber==0)
      _symptomNumber=2;
    else if(choiceNumber==2&&_symptomNumber==0)
      _symptomNumber=1;
    else if(choiceNumber==1&&_symptomNumber==1)
      _symptomNumber=2;
    else if(choiceNumber==2&&_symptomNumber==1)
      _symptomNumber=3;
    else if(choiceNumber==1&&_symptomNumber==2)
      _symptomNumber=5;
    else if(choiceNumber==2&&_symptomNumber==2)
      _symptomNumber=4;
    else
      restart();

  }
  void restart(){
    _symptomNumber=0;

  }

  bool buttonShouldBeVisible(){
    if(_symptomNumber==0||_symptomNumber==1||_symptomNumber==2)
      return true;
    else
      return false;
  }
}
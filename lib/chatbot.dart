
import 'package:flutter/material.dart';
import 'package:watson_assistant_v2/watson_assistant_v2.dart';
class Chatbot extends StatefulWidget {
  Chatbot({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChatbotState createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  String _text;
  WatsonAssistantV2Credential credential = WatsonAssistantV2Credential(
    username: 'apikey',
    apikey: 'Z7PJ-Fz7Y67qSKSgXZxR8EvvX2cuR-DGXl9nkJmN6kLY',
    assistantID: 'ee6e952e-2521-4d03-82e3-46ee2ebfa858',
    url: 'https://api.eu-gb.assistant.watson.cloud.ibm.com/instances/60d1e6fa-42ba-4a2e-9d4f-fae78ed68966/v2',
  );

  WatsonAssistantApiV2 watsonAssistant;
  WatsonAssistantResponse watsonAssistantResponse;
  WatsonAssistantContext watsonAssistantContext =
  WatsonAssistantContext(context: {});

  final myController = TextEditingController();

  void _callWatsonAssistant() async {
    watsonAssistantResponse = await watsonAssistant.sendMessage(
        myController.text, watsonAssistantContext);
    setState(() {
      _text = watsonAssistantResponse.resultText;
    });
    watsonAssistantContext = watsonAssistantResponse.context;
    myController.clear();
  }

  @override
  void initState() {
    super.initState();
    watsonAssistant =
        WatsonAssistantApiV2(watsonAssistantCredential: credential);
    _callWatsonAssistant();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watson_Assistant_V2'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.restore,
            ),
            onPressed: () {
              watsonAssistantContext.resetContext();
              setState(() {
                _text = null;
              });
            },
          )
        ],
      ),
      body: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: myController,
                decoration: InputDecoration(
                  hintText: 'Your Input to the chatbot',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                _text != null ? '$_text' : 'Watson Response Here',
                style: Theme.of(context).textTheme.display1,
              ),
              SizedBox(
                height: 24.0,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _callWatsonAssistant,
        child: Icon(Icons.send),
      ),
    );
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
}






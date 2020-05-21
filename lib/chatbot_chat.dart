import 'package:flutter/material.dart';
import 'package:watson_assistant_v2/watson_assistant_v2.dart';
import 'chat_message.dart';
class Chatbot extends StatefulWidget {
  Chatbot({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChatbotState createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  String _text;
  WatsonAssistantApiV2 watsonAssistant;
  WatsonAssistantResponse watsonAssistantResponse;
  WatsonAssistantContext watsonAssistantContext =
  WatsonAssistantContext(context: {});

  final _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  void _callWatsonAssistant() async {
    watsonAssistantResponse = await watsonAssistant.sendMessage(
        _textController.text, watsonAssistantContext);
    setState(() {
      _text = watsonAssistantResponse.resultText;
    });
    watsonAssistantContext = watsonAssistantResponse.context;
    _textController.clear();
  }
  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  void getResponse(query) async {
    _textController.clear();
    watsonAssistantResponse = await watsonAssistant.sendMessage(
        query, watsonAssistantContext);
    _text = watsonAssistantResponse.resultText;
    watsonAssistantContext = watsonAssistantResponse.context;
    ChatMessage message = new ChatMessage(
      text: watsonAssistantResponse.resultText ??
          "no response",
      name: "Bot",
      type: false,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }


  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      name: "me",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    getResponse(text);
  }

  @override
  void initState() {
    super.initState();
    watsonAssistant = WatsonAssistantApiV2(
        watsonAssistantCredential: WatsonAssistantV2Credential(
            username: 'apikey',
            apikey: 'jscOX35ToavABi423ZTClYKB6K7Rs0sxnFW4osnSX_gz',
            assistantID: 'c2d0939d-b2b3-47df-848b-4f03c7bff066',
            url: 'https://api.us-south.assistant.watson.cloud.ibm.com/instances/9c3f5334-9ae1-4b6d-8fc4-56176e38bca5/v2'

        ));
  }
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Ask me anything"),
      ),
      body: new Column(children: <Widget>[
        new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            )),
        new Divider(height: 1.0),
        new Container(
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          child: _buildTextComposer(),
        ),
      ]),
    );
  }
}

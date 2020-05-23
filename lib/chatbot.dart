import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
class ChatBot extends StatefulWidget {
  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Covid Assistant"),),
      body: WebView(
        initialUrl:"https://web-chat.global.assistant.watson.cloud.ibm.com/preview.html?region=eu-gb&integrationID=5be98453-a32f-4aba-b4a3-1b1e9d2cb810&serviceInstanceID=60d1e6fa-42ba-4a2e-9d4f-fae78ed68966" ,
      javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

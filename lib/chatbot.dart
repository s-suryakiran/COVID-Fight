import 'package:watson_assistant/watson_assistant.dart';
void main() async {
  WatsonAssistantCredential credential = WatsonAssistantCredential(
      username: "suryakiranbdsk@gmail.com",
      password: "Suka_2872",
      workspaceId: "d739d73f-ae1c-437b-b42b-812bed7124ac");

  WatsonAssistantApiV1 watsonAssistant = WatsonAssistantApiV1(
      watsonAssistantCredential: credential);

  WatsonAssistantContext watsonAssistantContext = WatsonAssistantContext(
      context: {});

  WatsonAssistantResult watsonAssistantResponse;

/*First interaction*/
  watsonAssistantResponse = await watsonAssistant.sendMessage("Hello",
      watsonAssistantContext); // context of the conversation initially void

  watsonAssistantContext = watsonAssistantResponse
      .context; // to store the progress of the conversation
  print(watsonAssistantResponse.resultText); // -->  "Hi i'm Watson Assistant!"

/*Second interaction*/
  watsonAssistantResponse = await watsonAssistant.sendMessage(
      "what's the weather tomorrow?", watsonAssistantContext);

  watsonAssistantContext = watsonAssistantResponse
      .context; // to store the progress of the conversation
  print(watsonAssistantResponse.resultText); // -->  "It will be sunny tomorrow"


/*Reset the context*/
  watsonAssistantContext.resetContext();
}
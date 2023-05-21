import 'package:get/get.dart';

import '../../../data/openai_service.dart';

class ChatPageController extends GetxController {
  @override
  void onInit() {
    Get.put(ChatPageController());
    super.onInit();
  }

  final openaiService = OpenAIService(
      apiKey:
          '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'); // Ganti xxx dengan OpenAI API key Anda

  final chatList = List<ChatItem>.empty(growable: true).obs;

  addChat(String text, bool isQuestion) async {
    chatList.add(ChatItem(text: text, isQuestion: isQuestion));
    update();
    if (isQuestion) {
      String response = await openaiService.getAIResponse(text);
      chatList.add(ChatItem(text: response, isQuestion: false));
      update();
    }
  }
}

class ChatItem {
  final String text;
  final bool isQuestion;

  ChatItem({required this.text, required this.isQuestion});
}

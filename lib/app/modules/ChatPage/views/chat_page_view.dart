import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_page_controller.dart';

class ChatPageView extends GetView<ChatPageController> {
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Chat Bot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              final chatList = controller.chatList;

              if (chatList.isEmpty) {
                return const SizedBox.shrink();
              }

              return ListView.builder(
                itemCount: chatList.length,
                itemBuilder: (context, index) {
                  final chatItem = chatList[index];

                  return Container(
                    alignment: chatItem.isQuestion
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    padding: const EdgeInsets.all(8),
                    child: Text(chatItem.text),
                  );
                },
              );
            }),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Type here'),
                    controller: messageController,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (messageController.text.isNotEmpty) {
                      var text = messageController.text;
                      messageController.clear();
                      controller.addChat(text, true);
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

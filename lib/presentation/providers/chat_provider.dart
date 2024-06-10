import 'package:flutter/material.dart';
import 'package:yesno/config/helpers/get_yes_no_answer.dart';
import 'package:yesno/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  List<Message> messages = [
    Message(from: FROM.bot, text: 'Ask yes or no questions', timeStamp: DateTime.now().toIso8601String(), imageUrl: 'https://sm.ign.com/ign_nordic/cover/a/avatar-gen/avatar-generations_prsz.jpg'),
  ];

  Future<void> addMessage(Message newMessage) async {
    messages.insert(0, newMessage);

    if (newMessage.text.endsWith('?')) {
      await getYesNoAnswer();
    }

    moveToTop(); 
    notifyListeners();
  }

  Future<void> getYesNoAnswer() async {
    final message = await GetYesNoAnswer().getAnswer();
    addMessage(message);

    moveToTop();
  }

  void moveToTop() {
    if (chatScrollController.hasClients) {
      chatScrollController.animateTo(
        0, 
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }
}
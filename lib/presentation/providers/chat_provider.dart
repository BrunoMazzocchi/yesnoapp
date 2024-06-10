import 'package:flutter/material.dart';
import 'package:yesno/config/helpers/get_yes_no_answer.dart';
import 'package:yesno/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();

  List<Message> message = [
    Message(from: FROM.bot, text: 'Ask yes or no questions', timeStamp: DateTime.now().toIso8601String(), imageUrl: 'https://sm.ign.com/ign_nordic/cover/a/avatar-gen/avatar-generations_prsz.jpg'),
  ];

  Future<void> addMessage(Message newMessage) async {
    message.add(newMessage);

    if(newMessage.text.endsWith('?')) {
      await getYesNoAnswer();
    }

    moveToBottom();
    notifyListeners();
  }

  Future<void> getYesNoAnswer() async {
    final message = await GetYesNoAnswer().getAnswer();
    addMessage(message);
    
    moveToBottom();
  }

  void moveToBottom() {
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
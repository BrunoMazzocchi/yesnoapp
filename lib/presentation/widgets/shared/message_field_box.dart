import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onMessageSent;
  const MessageFieldBox({super.key, required this.onMessageSent});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    // It will be used to focus on the text field and keep it
    final FocusNode focusNode = FocusNode();

    void sendMessage(String message) async {
      debugPrint(message);
      onMessageSent(message);
      textController.clear();
    }

    return Row(
            children: [
               const SizedBox(width: 10,),
               Expanded(
                child: TextFormField(
                  focusNode: focusNode,
                  keyboardType: TextInputType.text,
                  controller: textController,
                  decoration: const InputDecoration(
                    hintText: 'Type a message and end it with "?"',
                    border: InputBorder.none,
                  ),
                  onFieldSubmitted: (value) {
                    debugPrint(value);
                    textController.clear();
                    focusNode.requestFocus();
                    sendMessage(value);
                  },
                  onChanged: (value) => debugPrint(value),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  sendMessage(textController.text);
                },
              ),
            ],
          );
  }
}
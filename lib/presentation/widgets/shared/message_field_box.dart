import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    // It will be used to focus on the text field and keep it
    final FocusNode focusNode = FocusNode();

    return Row(
            children: [
              IconButton(
                icon: const Icon(Icons.camera_alt),
                onPressed: () {},
              ),
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
                  },
                  onChanged: (value) => debugPrint(value),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  debugPrint(textController.text);
                  textController.clear();
                },
              ),
            ],
          );
  }
}
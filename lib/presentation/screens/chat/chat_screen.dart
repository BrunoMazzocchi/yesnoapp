import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesno/domain/entities/message.dart';
import 'package:yesno/presentation/providers/chat_provider.dart';
import 'package:yesno/presentation/widgets/incomming_message_bubble.dart';
import 'package:yesno/presentation/widgets/my_message_bubble.dart';
import 'package:yesno/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BOT'),
        centerTitle: false,
        leading: const Padding(
          padding:  EdgeInsets.all(8),
          child: CircleAvatar(
          backgroundImage: NetworkImage('https://sm.ign.com/ign_nordic/cover/a/avatar-gen/avatar-generations_prsz.jpg'),
         ),
        ),
      ),
      body: const _ChatView(),
    );
  }
}


class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Column( 
        children: [
          Expanded(
            child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.message.length,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {

                final message = chatProvider.message[index];

                return (message.from == FROM.bot
                    ? IncommingMessageBubble(
                        message: message,
                      )
                    : MyMessageBubble(
                        message: message,
                      ));
              },
            ),
          ),
          const Divider(height: 1),
           MessageFieldBox(
            onMessageSent: (message) {
              chatProvider.addMessage(Message(
                from: FROM.user,
                text: message,
                timeStamp: DateTime.now().toIso8601String(),
              ));
            },
          ),
        ],
      ),
    );
  }
}

 

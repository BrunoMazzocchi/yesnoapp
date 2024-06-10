import 'package:flutter/material.dart';
import 'package:yesno/presentation/widgets/incomming_message_bubble.dart';
import 'package:yesno/presentation/widgets/my_message_bubble.dart';
import 'package:yesno/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bruno Mazzocchi'),
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
    return SafeArea(
      child: Column( 
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                return (
                  index.isEven
                  ? const MyMessageBubble(
                      message: 'Hello, how are you?',
                      hour: '10:00',
                    )
                  : const IncommingMessageBubble(
                      message: 'Hello, I am fine, thanks',
                      hour: '10:00',
                    )
                );
              },
            ),
          ),
          const Divider(height: 1),
          const MessageFieldBox(),
        ],
      ),
    );
  }
}

 

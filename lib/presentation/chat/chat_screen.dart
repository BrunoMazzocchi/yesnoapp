import 'package:flutter/material.dart';

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

  Widget message (String text) {
    // List tile that includes the message and current house at the bottom
    return ListTile(
      title: Text(text),
      subtitle: const Text('12:00 PM'),
      trailing: const CircleAvatar(
        backgroundImage: NetworkImage('https://sm.ign.com/ign_nordic/cover/a/avatar-gen/avatar-generations_prsz.jpg'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column( 
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return message("Message $index");
              },
            ),
          ),
          const Divider(height: 1),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.camera_alt),
                onPressed: () {},
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Type a message',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

 

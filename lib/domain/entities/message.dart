enum FROM { 
  user, 
  bot 
}

class Message { 
  final String text; 
  final String? imageUrl; 
  final FROM from;
  final String timeStamp; 


  Message({required this.text, this.imageUrl, required this.from, required this.timeStamp});

  // From JSON
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      text: json['answer'],
      imageUrl: json['image'],
      from: json['from'] ?? FROM.bot,
      timeStamp: json['timeStamp'] ?? DateTime.now().toIso8601String(),
    );
  }
}
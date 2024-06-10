
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
}
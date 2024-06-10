import 'package:yesno/domain/entities/message.dart';

class YesNoModel { 
  final String answer; 
  final bool forced; 
  final String image; 

  YesNoModel({
    required this.answer, 
    required this.forced, 
    required this.image,
  });

  factory YesNoModel.fromJson(Map<String, dynamic> json) {
    return YesNoModel(
      answer: json['answer'],
      forced: json['forced'],
      image: json['image'],
    );
  }

  // Print the model
  @override
  String toString() {
    return 'YesNoModel(answer: $answer, forced: $forced, image: $image)';
  }

  Message toMessage() {
    return Message(
      text: answer,
      imageUrl: image,
      from: FROM.bot,
      timeStamp: DateTime.now().toIso8601String(),
    );
  }
}
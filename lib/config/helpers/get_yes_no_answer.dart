import 'package:yesno/domain/entities/message.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer { 
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://yesno.wtf/api',
    ),
  );

  Future<Message> getAnswer() async {
    return _dio.get('/').then((response) {
      final data = response.data;
      return Message.fromJson(data);
    });
  }
}
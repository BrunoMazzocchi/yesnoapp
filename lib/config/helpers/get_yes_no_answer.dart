import 'package:flutter/material.dart';
import 'package:yesno/domain/entities/message.dart';
import 'package:dio/dio.dart';
import 'package:yesno/infraestrucutre/models/yes_no_model.dart';

class GetYesNoAnswer { 
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://yesno.wtf/api',
    ),
  );

  Future<Message> getAnswer() async {
    return _dio.get('/').then((response) {
      final data = response.data;
      final model =  YesNoModel.fromJson(data);
      debugPrint('Model: ${model.toString()}');
      return model.toMessage();
    });
  }
}
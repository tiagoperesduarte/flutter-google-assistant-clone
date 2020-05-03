import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutterdialogflow/app/models/bot_message.dart';

class MessageRepository {
  final Dio _dio;

  MessageRepository(this._dio);

  Future<BotMessage> getMessage() async {
    await Future.delayed(Duration(seconds: 2));

    String contents = await rootBundle.loadString("assets/data/message.json");
    return BotMessage.fromJson(json.decode(contents));
  }
}

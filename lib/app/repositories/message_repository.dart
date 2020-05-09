import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:fluttergoogleassistantclone/app/models/message/bot_message.dart';

class MessageRepository {
  final Dio _dio;

  MessageRepository(this._dio);

  Future<BotMessage> getBotMessage(String text) async {
    await Future.delayed(Duration(seconds: 2));

    String contents = await rootBundle.loadString("assets/data/bot_message.json");
    return BotMessage.fromJson(json.decode(contents));
  }
}

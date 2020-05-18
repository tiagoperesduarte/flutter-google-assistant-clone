import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:fluttergoogleassistantclone/app/models/message/bot_message.dart';
import 'package:fluttergoogleassistantclone/app/models/message/message.dart';

class MessageRepository {
  final Dio _dio;

  MessageRepository(this._dio);

  Future<List<Message>> getMessages() async {
    await Future.delayed(Duration(seconds: 1));

    String contents = await rootBundle.loadString("assets/data/messages.json");
    Map<String, dynamic> response = json.decode(contents);

    return (response["content"] as List).map((m) => Message.fromJson(m)).toList();
  }

  Future<Message> getBotMessage(String text) async {
    await Future.delayed(Duration(seconds: 1));

    String contents = await rootBundle.loadString("assets/data/bot_message.json");
    Map<String, dynamic> response = json.decode(contents);

    return BotMessage.fromJson(response["content"]);
  }
}

import 'package:flutter/material.dart';
import 'package:fluttergoogleassistantclone/app/models/message/bot_message.dart';
import 'package:fluttergoogleassistantclone/app/models/message/message_from.dart';
import 'package:fluttergoogleassistantclone/app/models/message/user_message.dart';
import 'package:fluttergoogleassistantclone/app/utils/enum_utils.dart';

abstract class Message {
  MessageFrom from;

  Message(this.from);

  factory Message.fromJson(Map<String, dynamic> json) {
    MessageFrom from = EnumUtils.fromString(MessageFrom.values, json['from']);

    switch (from) {
      case MessageFrom.bot:
        return BotMessage.fromJson(json);

      case MessageFrom.user:
        return UserMessage.fromJson(json);

      default:
        return null;
    }
  }

  Widget toWidget();
}

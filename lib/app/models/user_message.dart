import 'package:flutter/material.dart';
import 'package:fluttergoogleassistantclone/app/models/message.dart';
import 'package:fluttergoogleassistantclone/app/models/message_from.dart';
import 'package:fluttergoogleassistantclone/app/widgets/speech_bubble/user_speech_bubble_widget.dart';

class UserMessage extends Message {
  String text;

  UserMessage(String text) {
    this.from = MessageFrom.user;
    this.text = text;
  }

  factory UserMessage.fromText(String text) {
    return UserMessage(text);
  }

  @override
  Widget toWidget() {
    return UserSpeechBubbleWidget(text);
  }
}

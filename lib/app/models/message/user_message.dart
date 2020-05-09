import 'package:flutter/material.dart';
import 'package:fluttergoogleassistantclone/app/models/message/message.dart';
import 'package:fluttergoogleassistantclone/app/models/message/message_from.dart';
import 'package:fluttergoogleassistantclone/app/widgets/speech_bubble/user_speech_bubble_widget.dart';

class UserMessage extends Message {
  String text;

  UserMessage(this.text) : super(MessageFrom.user);

  @override
  Widget toWidget() {
    return UserSpeechBubbleWidget(text);
  }
}

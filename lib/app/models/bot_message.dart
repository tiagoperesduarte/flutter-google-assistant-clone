import 'package:flutter/material.dart';
import 'package:fluttergoogleassistantclone/app/models/bot_message_widget.dart';
import 'package:fluttergoogleassistantclone/app/models/message.dart';
import 'package:fluttergoogleassistantclone/app/models/message_from.dart';
import 'package:fluttergoogleassistantclone/app/widgets/speech_bubble/bot_speech_bubble_widget.dart';

class BotMessage extends Message {
  List<String> texts;
  List<BotMessageWidget> widgets;

  BotMessage(List<String> texts, List<BotMessageWidget> widgets) {
    this.from = MessageFrom.bot;
    this.texts = texts;
    this.widgets = widgets;
  }

  factory BotMessage.fromText(String text) {
    List<String> texts = List<String>();
    texts.add(text);

    return BotMessage(texts, List<BotMessageWidget>());
  }

  factory BotMessage.fromJson(Map<String, dynamic> json) {
    List<String> texts = json['texts'].cast<String>();

    return BotMessage(texts, List<BotMessageWidget>());
  }

  @override
  Widget toWidget() {
    return BotSpeechBubbleWidget(texts);
  }
}

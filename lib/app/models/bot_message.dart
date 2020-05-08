import 'package:flutter/material.dart';
import 'package:fluttergoogleassistantclone/app/models/bot_message_widget.dart';
import 'package:fluttergoogleassistantclone/app/models/message.dart';
import 'package:fluttergoogleassistantclone/app/models/message_from.dart';
import 'package:fluttergoogleassistantclone/app/widgets/speech_bubble/bot_speech_bubble_widget.dart';

class BotMessage extends Message {
  List<String> texts;
  List<BotMessageWidget> widgets;
  List<String> suggestionChips;

  BotMessage(List<String> texts, List<BotMessageWidget> widgets, List<String> suggestionChips) {
    this.from = MessageFrom.bot;
    this.texts = texts;
    this.widgets = widgets;
    this.suggestionChips = suggestionChips;
  }

  factory BotMessage.fromText(String text) {
    List<String> texts = List<String>.of([text]);

    return BotMessage(texts, List<BotMessageWidget>(), List<String>());
  }

  factory BotMessage.fromJson(Map<String, dynamic> json) {
    List<String> texts = json['texts'].cast<String>();
    List<String> suggestionChips = json['suggestionChips'].cast<String>();

    return BotMessage(texts, List<BotMessageWidget>(), suggestionChips);
  }

  @override
  Widget toWidget() {
    return BotSpeechBubbleWidget(texts);
  }
}

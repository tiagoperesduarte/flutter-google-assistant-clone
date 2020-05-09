import 'package:flutter/material.dart';
import 'package:fluttergoogleassistantclone/app/models/message/message.dart';
import 'package:fluttergoogleassistantclone/app/models/message/message_from.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/message_widget.dart';
import 'package:fluttergoogleassistantclone/app/widgets/speech_bubble/bot_speech_bubble_widget.dart';

class BotMessage extends Message {
  List<String> texts;
  List<MessageWidget> widgets;
  List<String> suggestionChips;

  BotMessage(this.texts, this.widgets, this.suggestionChips) : super(MessageFrom.bot);

  factory BotMessage.fromText(String text) {
    List<String> texts = List<String>.of([text]);

    return BotMessage(texts, List<MessageWidget>(), List<String>());
  }

  factory BotMessage.fromTexts(List<String> texts) {
    return BotMessage(texts, List<MessageWidget>(), List<String>());
  }

  factory BotMessage.fromJson(Map<String, dynamic> json) {
    List<String> texts = json['texts'].cast<String>();
    List<String> suggestionChips = json['suggestionChips'].cast<String>();
    List<MessageWidget> widgets = List<MessageWidget>();

    if (json['widgets'] != null) {
      json['widgets'].forEach((w) {
        MessageWidget widget = MessageWidget.fromJson(w);

        if (widget != null) {
          widgets.add(widget);
        }
      });
    }

    return BotMessage(texts, widgets, suggestionChips);
  }

  @override
  Widget toWidget() {
    return BotSpeechBubbleWidget(texts);
  }
}

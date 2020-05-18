import 'package:flutter/material.dart';
import 'package:fluttergoogleassistantclone/app/models/message/message.dart';
import 'package:fluttergoogleassistantclone/app/models/message/message_from.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/message_widget.dart';
import 'package:fluttergoogleassistantclone/app/utils/list_utils.dart';
import 'package:fluttergoogleassistantclone/app/widgets/speech_bubble/bot_speech_bubble_widget.dart';
import 'package:separated_column/separated_column.dart';

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
      json['widgets'].forEach((map) {
        MessageWidget widget = MessageWidget.fromJson(map);

        if (widget != null) {
          widgets.add(widget);
        }
      });
    }

    return BotMessage(texts, widgets, suggestionChips);
  }

  @override
  Widget toWidget() {
    List<Widget> widgets = List<Widget>();

    if (ListUtils.isNotEmpty(texts)) {
      widgets.add(BotSpeechBubbleWidget(
        texts: texts,
      ));
    }

    if (ListUtils.isNotEmpty(this.widgets)) {
      this.widgets.forEach((w) {
        Widget widget = w.toWidget();

        if (widget != null) {
          widgets.add(w.toWidget());
        }
      });
    }

    return SeparatedColumn(
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 8);
      },
      children: widgets,
    );
  }
}

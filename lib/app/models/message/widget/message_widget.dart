import 'package:flutter/material.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/message_chart.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/message_card.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/message_widget_type.dart';
import 'package:fluttergoogleassistantclone/app/utils/enum_utils.dart';

abstract class MessageWidget {
  String title;
  MessageWidgetType type;

  MessageWidget(this.title, this.type);

  factory MessageWidget.fromJson(Map<String, dynamic> json) {
    MessageWidgetType type = EnumUtils.fromString(MessageWidgetType.values, json['type']);

    switch (type) {
      case MessageWidgetType.card:
        return MessageCard.fromJson(json);

      case MessageWidgetType.chart:
        return MessageChart.fromJson(json);

      default:
        return null;
    }
  }

  Widget toWidget();
}

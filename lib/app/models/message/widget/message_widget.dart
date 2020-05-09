import 'package:fluttergoogleassistantclone/app/models/message/widget/card_widget.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/chart_widget.dart';
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
        return CardWidget.fromJson(json);

      case MessageWidgetType.chart:
        return ChartWidget.fromJson(json);

      default:
        return null;
    }
  }
}

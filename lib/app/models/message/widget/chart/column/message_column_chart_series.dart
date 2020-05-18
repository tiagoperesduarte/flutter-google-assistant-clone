import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/column/message_column_chart_data.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/message_chart_data.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/message_chart_series.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/message_chart_type.dart';

class MessageColumnChartSeries extends MessageChartSeries {
  String stack;
  String hexColor;

  MessageColumnChartSeries(
    String name,
    List<MessageChartData> data,
    this.stack,
    this.hexColor,
  ) : super(name, data, MessageChartType.column);

  factory MessageColumnChartSeries.fromJson(Map<String, dynamic> json) {
    String name = json["name"];
    String stack = json["stack"];
    String hexColor = json["hexColor"];
    List<MessageChartData> data = List<MessageChartData>();

    if (json['data'] != null) {
      json['data'].forEach((map) {
        MessageColumnChartData chartData = MessageColumnChartData.fromJson(map);

        if (chartData != null) {
          data.add(chartData);
        }
      });
    }

    return MessageColumnChartSeries(name, data, stack, hexColor);
  }
}

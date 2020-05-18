import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/column/message_column_chart_series.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/message_chart_data.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/message_chart_type.dart';
import 'package:fluttergoogleassistantclone/app/utils/enum_utils.dart';

abstract class MessageChartSeries {
  String name;
  List<MessageChartData> data;
  MessageChartType seriesType;

  MessageChartSeries(this.name, this.data, this.seriesType);

  factory MessageChartSeries.fromJson(Map<String, dynamic> json) {
    MessageChartType seriesType = EnumUtils.fromString(MessageChartType.values, json['seriesType']);

    switch (seriesType) {
      case MessageChartType.column:
        return MessageColumnChartSeries.fromJson(json);

      default:
        return null;
    }
  }
}

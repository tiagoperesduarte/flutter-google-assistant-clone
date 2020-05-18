import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/column/message_column_chart.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/message_chart_series.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/message_chart_type.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/message_widget.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/message_widget_type.dart';
import 'package:fluttergoogleassistantclone/app/utils/enum_utils.dart';

abstract class MessageChart extends MessageWidget {
  String subtitle;
  MessageChartType chartType;
  List<MessageChartSeries> series;

  MessageChart(
    String title,
    this.subtitle,
    this.chartType,
    this.series,
  ) : super(title, MessageWidgetType.chart);

  factory MessageChart.fromJson(Map<String, dynamic> json) {
    MessageChartType chartType = EnumUtils.fromString(MessageChartType.values, json['chartType']);

    switch (chartType) {
      case MessageChartType.column:
        return MessageColumnChart.fromJson(json);

      default:
        return null;
    }
  }
}

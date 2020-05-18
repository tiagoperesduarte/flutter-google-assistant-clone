import 'package:flutter/material.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/message_chart.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/message_chart_series.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/message_chart_stacking.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/message_chart_type.dart';
import 'package:fluttergoogleassistantclone/app/utils/enum_utils.dart';
import 'package:fluttergoogleassistantclone/app/widgets/chart/column_chart_widget.dart';

class MessageColumnChart extends MessageChart {
  MessageChartStacking stacking;

  MessageColumnChart(
    String title,
    String subtitle,
    List<MessageChartSeries> series,
    this.stacking,
  ) : super(title, subtitle, MessageChartType.column, series);

  factory MessageColumnChart.fromJson(Map<String, dynamic> json) {
    String title = json["title"];
    String subtitle = json["subtitle"];
    MessageChartStacking stacking = EnumUtils.fromString(MessageChartStacking.values, json["stacking"]);
    List<MessageChartSeries> series = List<MessageChartSeries>();

    if (json['series'] != null) {
      json['series'].forEach((map) {
        MessageChartSeries chartSeries = MessageChartSeries.fromJson(map);

        if (chartSeries != null) {
          series.add(chartSeries);
        }
      });
    }

    return MessageColumnChart(title, subtitle, series, stacking);
  }

  @override
  Widget toWidget() {
    return ColumnChartWidget(this);
  }
}

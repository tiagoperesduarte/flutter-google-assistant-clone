import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/chart_series.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/chart_type.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/message_widget.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/message_widget_type.dart';

abstract class ChartWidget extends MessageWidget {
  String subtitle;
  ChartType chartType;
  List<ChartSeries> series;

  ChartWidget(
    String title,
    this.subtitle,
    this.chartType,
    this.series,
  ) : super(title, MessageWidgetType.chart);

  factory ChartWidget.fromJson(Map<String, dynamic> json) {
    return null;
  }
}

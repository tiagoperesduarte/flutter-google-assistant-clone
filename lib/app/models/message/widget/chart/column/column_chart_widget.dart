import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/chart_series.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/chart_stacking.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/chart_type.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/chart_widget.dart';

class ColumnChartWidget extends ChartWidget {
  ChartStacking stacking;

  ColumnChartWidget(
    String title,
    String subtitle,
    ChartType chartType,
    List<ChartSeries> series,
    this.stacking,
  ) : super(title, subtitle, chartType, series);
}

import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/chart_data.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/chart_type.dart';

abstract class ChartSeries {
  String name;
  List<ChartData> data;
  ChartType seriesType;
}

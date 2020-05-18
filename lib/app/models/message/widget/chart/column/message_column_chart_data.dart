import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/message_chart_data.dart';

class MessageColumnChartData extends MessageChartData {
  String label;
  double value;

  MessageColumnChartData(
    String tooltip,
    this.label,
    this.value,
  ) : super(tooltip);

  factory MessageColumnChartData.fromJson(Map<String, dynamic> json) {
    String tooltip = json["tooltip"];
    String label = json["label"];
    double value = json["value"];

    return MessageColumnChartData(tooltip, label, value);
  }
}

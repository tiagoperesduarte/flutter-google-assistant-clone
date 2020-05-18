import 'package:fluttergoogleassistantclone/app/utils/list_utils.dart';
import 'package:mp_chart/mp/core/value_formatter/value_formatter.dart';

class LabelValueFormatter extends ValueFormatter {
  final List<String> labels;
  final int seriesSize;

  LabelValueFormatter(this.labels, this.seriesSize);

  @override
  String getFormattedValue1(double value) {
    if (seriesSize > 1 && value % 1 == 0) {
      return null;
    }

    int index = value.toInt();

    if (ListUtils.indexExists(labels, index)) {
      return labels[index];
    }

    return null;
  }
}

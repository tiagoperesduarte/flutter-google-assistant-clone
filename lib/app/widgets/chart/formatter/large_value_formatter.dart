import 'package:mp_chart/mp/core/value_formatter/value_formatter.dart';

class LargeValueFormatter extends ValueFormatter {
  @override
  String getFormattedValue1(double value) {
    return "${value.toInt()}   ";
  }
}

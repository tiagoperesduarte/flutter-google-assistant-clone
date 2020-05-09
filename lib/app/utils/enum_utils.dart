import 'package:enum_to_string/enum_to_string.dart';

class EnumUtils {
  static T fromString<T>(List<T> enumValues, String value) {
    return EnumToString.fromString(enumValues, value);
  }
}

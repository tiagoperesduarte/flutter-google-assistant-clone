class StringUtils {
  static bool isEmpty(String str) {
    return str == null || str.length == 0;
  }

  static bool isNotEmpty(String str) {
    return !isEmpty(str);
  }

  static String capitalize(String str) {
    return str[0].toUpperCase() + str.substring(1);
  }
}

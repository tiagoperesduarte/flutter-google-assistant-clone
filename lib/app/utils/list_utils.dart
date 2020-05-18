class ListUtils {
  static bool isEmpty(List list) {
    return list == null || list.isEmpty;
  }

  static bool isNotEmpty(List list) {
    return !isEmpty(list);
  }

  static bool indexExists(List list, int index) {
    return index >= 0 && index < list.length;
  }
}

class ListUtils {
  static bool isEmpty(List list) {
    return list == null || list.isEmpty;
  }

  static bool isNotEmpty(List list) {
    return !isEmpty(list);
  }
}

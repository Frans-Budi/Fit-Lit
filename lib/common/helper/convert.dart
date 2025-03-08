class Convert {
  static int listBoolToPercentage(List<bool> list) {
    if (list.isEmpty) return 0;

    int totalCount = list.length;
    int trueCount = list.where((value) => value).length;

    return ((trueCount / totalCount) * 100).round();
  }
}

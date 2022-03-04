
enum DisabledDegreeEnum {
  none,
  firstDegreeDisabled,
  secondDegreeDisabled,
  thirdDegreeDisabled
}

extension DisabledDegreeExtension on DisabledDegreeEnum {
  static List<String> getList() {
    List<String> disabledDegreeList = [];
    for (var item in DisabledDegreeEnum.values) {
      disabledDegreeList.add(item.getName);
    }
    return disabledDegreeList;
  }

  String get getName {
    switch (this) {
      case DisabledDegreeEnum.none:
        return "Engeli Yok";
      case DisabledDegreeEnum.firstDegreeDisabled:
        return "1. Dereceden Engelli";
      case DisabledDegreeEnum.secondDegreeDisabled:
        return "2. Dereceden Engelli";
      case DisabledDegreeEnum.thirdDegreeDisabled:
        return "3. Dereceden Engelli";
      default:
        return "";
    }
  }
}

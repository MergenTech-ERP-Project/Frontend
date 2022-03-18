enum DisabledDegreeEnum {
  none,
  noneDisability,
  firstDegreeDisabled,
  secondDegreeDisabled,
  thirdDegreeDisabled
}

extension DisabledDegreeExtension on DisabledDegreeEnum {
  static List<String> getList() {
    List<String> disabledDegreeList = [];
    for (int i = 0; i < DisabledDegreeEnum.values.length; i++) {
      disabledDegreeList.add(DisabledDegreeEnum.values[i].getName);
    }
    return disabledDegreeList;
  }

  String get getName {
    switch (this) {
      case DisabledDegreeEnum.none:
        return "seçiniz...";
      case DisabledDegreeEnum.noneDisability:
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

  static getEnumFromName(name) {
    return DisabledDegreeEnum
        .values[DisabledDegreeExtension.getList().indexOf(name)];
  }
}

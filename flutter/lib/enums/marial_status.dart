enum MaritalStatusEnum {
  none,
  married,
  single,
  unspecified,
}

extension MaritalStatusExtension on MaritalStatusEnum {
  static List<String> getList() {
    List<String> maritalStatusList = [];
    for (int i = 0; i < MaritalStatusEnum.values.length; i++) {
      maritalStatusList.add(MaritalStatusEnum.values[i].getName);
    }
    return maritalStatusList;
  }

  String get getName {
    switch (this) {
      case MaritalStatusEnum.none:
        return "seçiniz...";
      case MaritalStatusEnum.married:
        return "Evli";
      case MaritalStatusEnum.single:
        return "Bekar";
      case MaritalStatusEnum.unspecified:
        return "Belirtilmemiş";
      default:
        return "";
    }
  }

  static getEnumFromName(name) {
    return MaritalStatusEnum
        .values[MaritalStatusExtension.getList().indexOf(name)];
  }
}

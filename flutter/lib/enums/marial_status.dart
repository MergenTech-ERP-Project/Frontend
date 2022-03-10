enum MaritalStatusEnum {
  married,
  single,
  unspecified,
}

extension MaritalStatusExtension on MaritalStatusEnum {
  static List<String> getList() {
    List<String> maritalStatusList = [];
    for (var item in MaritalStatusEnum.values) {
      maritalStatusList.add(item.getName);
    }
    return maritalStatusList;
  }

  String get getName {
    switch (this) {
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

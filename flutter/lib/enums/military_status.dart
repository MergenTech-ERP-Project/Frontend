enum MilitaryStatusEnum {
  none,
  done,
  notDone,
  exempt,
  deferred,
}

extension MilitaryStatusEnumExtension on MilitaryStatusEnum {
  static List<String> getList() {
    List<String> militaryStatusList = [];
    for (int i = 0; i < MilitaryStatusEnum.values.length; i++) {
      militaryStatusList.add(MilitaryStatusEnum.values[i].getName);
    }
    return militaryStatusList;
  }

  String get getName {
    switch (this) {
      case MilitaryStatusEnum.none:
        return "seçiniz...";
      case MilitaryStatusEnum.done:
        return "Yapıldı";
      case MilitaryStatusEnum.notDone:
        return "Yapılmadı";
      case MilitaryStatusEnum.exempt:
        return "Muaf";
      case MilitaryStatusEnum.deferred:
        return "Tecilli";
      default:
        return "";
    }
  }

  static getEnumFromName(name) {
    return MilitaryStatusEnum
        .values[MilitaryStatusEnumExtension.getList().indexOf(name)];
  }
}

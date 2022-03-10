enum HighestEducationLevelCompletedEnum {
  primarySchool,
  middleSchool,
  highSchool,
  associateDegree,
  bachelorsDegree,
  mastersDegree,
  doctoratePhd,
  none,
}

extension HighestEducationLevelCompletedExtension
    on HighestEducationLevelCompletedEnum {
  static List<String> getList() {
    List<String> highestEducationLevelCompletedList = [];
    for (var item in HighestEducationLevelCompletedEnum.values) {
      highestEducationLevelCompletedList.add(item.getName);
    }
    return highestEducationLevelCompletedList;
  }

  String get getName {
    switch (this) {
      case HighestEducationLevelCompletedEnum.primarySchool:
        return "İlkokul";
      case HighestEducationLevelCompletedEnum.middleSchool:
        return "Ortaokul";
      case HighestEducationLevelCompletedEnum.highSchool:
        return "Lise";
      case HighestEducationLevelCompletedEnum.associateDegree:
        return "Ön Lisans";
      case HighestEducationLevelCompletedEnum.bachelorsDegree:
        return "Lisans";
      case HighestEducationLevelCompletedEnum.mastersDegree:
        return "Yüksek Lisans";
      case HighestEducationLevelCompletedEnum.doctoratePhd:
        return "Doktora";
      case HighestEducationLevelCompletedEnum.none:
        return "Yok";
      default:
        return "";
    }
  }

  static getEnumFromName(name) {
    return HighestEducationLevelCompletedEnum.values[
        HighestEducationLevelCompletedExtension.getList().indexOf(name)];
  }
}

enum HighestEducationLevelCompletedEnum {
  none,
  primarySchool,
  middleSchool,
  highSchool,
  associateDegree,
  bachelorsDegree,
  mastersDegree,
  doctoratePhd,
  noneEducation,
}

extension HighestEducationLevelCompletedExtension
    on HighestEducationLevelCompletedEnum {
  static List<String> getList() {
    List<String> highestEducationLevelCompletedList = [];
    for (int i = 0; i < HighestEducationLevelCompletedEnum.values.length; i++) {
      highestEducationLevelCompletedList
          .add(HighestEducationLevelCompletedEnum.values[i].getName);
    }
    return highestEducationLevelCompletedList;
  }

  String get getName {
    switch (this) {
      case HighestEducationLevelCompletedEnum.none:
        return "seçiniz...";
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
      case HighestEducationLevelCompletedEnum.noneEducation:
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

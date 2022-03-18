enum EducationalStatusEnum {
  none,
  student,
  graduate,
}

extension EducationalStatusExtension on EducationalStatusEnum {
  static List<String> getList() {
    List<String> educationalStatusList = [];
    for (int i = 0; i < EducationalStatusEnum.values.length; i++) {
      educationalStatusList.add(EducationalStatusEnum.values[i].getName);
    }
    return educationalStatusList;
  }

  String get getName {
    switch (this) {
      case EducationalStatusEnum.none:
        return "seçiniz...";
      case EducationalStatusEnum.student:
        return "Öğrenci";
      case EducationalStatusEnum.graduate:
        return "Mezun";

      default:
        return "";
    }
  }

  static getEnumFromName(name) {
    return EducationalStatusEnum
        .values[EducationalStatusExtension.getList().indexOf(name)];
  }
}

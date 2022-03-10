
enum EducationalStatusEnum {
  student,
  graduate,
}

extension EducationalStatusExtension on EducationalStatusEnum {
  static List<String> getList() {
    List<String> educationalStatusList = [];
    for (var item in EducationalStatusEnum.values) {
      educationalStatusList.add(item.getName);
    }
    return educationalStatusList;
  }

  String get getName {
    switch (this) {
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

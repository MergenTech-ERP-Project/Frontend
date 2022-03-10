enum GenderEnum {
  male,
  female,
  unspecified,
}

extension GenderExtension on GenderEnum {
  static List<String> getList() {
    List<String> genderList = [];
    for (var item in GenderEnum.values) {
      genderList.add(item.getName);
    }
    return genderList;
  }

  String get getName {
    switch (this) {
      case GenderEnum.male:
        return "Erkek";
      case GenderEnum.female:
        return "Kadın";
      case GenderEnum.unspecified:
        return "Belirtilmemiş";

      default:
        return "";
    }
  }

  static getEnumFromName(name) {
    return GenderEnum.values[GenderExtension.getList().indexOf(name)];
  }
}

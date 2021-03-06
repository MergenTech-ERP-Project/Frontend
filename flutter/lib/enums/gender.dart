enum GenderEnum {
  none,
  male,
  female,
  unspecified,
}

extension GenderExtension on GenderEnum {
  static List<String> getList() {
    List<String> genderList = [];
    for (int i = 0; i < GenderEnum.values.length; i++) {
      genderList.add(GenderEnum.values[i].getName);
    }
    return genderList;
  }

  String get getName {
    switch (this) {
      case GenderEnum.none:
        return "seçiniz...";
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

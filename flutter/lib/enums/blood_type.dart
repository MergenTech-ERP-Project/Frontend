enum BloodTypeEnum {
  none,
  zeroPlus,
  zeroMinus,
  aPlus,
  aMinus,
  bPlus,
  bMinus,
  abPlus,
  abMinus,
}

extension BloodTypeEnumExtension on BloodTypeEnum {
  static List<String> getList() {
    List<String> bloodTypeList = [];
    for (int i = 0; i < BloodTypeEnum.values.length; i++) {
      bloodTypeList.add(BloodTypeEnum.values[i].getName);
    }
    return bloodTypeList;
  }

  String get getName {
    switch (this) {
      case BloodTypeEnum.none:
        return "seçiniz...";
      case BloodTypeEnum.zeroPlus:
        return "0+";
      case BloodTypeEnum.zeroMinus:
        return "0-";
      case BloodTypeEnum.aPlus:
        return "A+";
      case BloodTypeEnum.aMinus:
        return "A-";
      case BloodTypeEnum.bPlus:
        return "B+";
      case BloodTypeEnum.bMinus:
        return "B-";
      case BloodTypeEnum.abPlus:
        return "AB+";
      case BloodTypeEnum.abMinus:
        return "AB-";
      default:
        return "";
    }
  }

  static getEnumFromName(name) {
    return BloodTypeEnum.values[BloodTypeEnumExtension.getList().indexOf(name)];
  }
}

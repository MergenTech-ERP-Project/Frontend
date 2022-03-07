enum BloodTypeEnum {
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
    for (var item in BloodTypeEnum.values) {
      bloodTypeList.add(item.getName);
    }
    return bloodTypeList;
  }

  String get getName {
    switch (this) {
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
}

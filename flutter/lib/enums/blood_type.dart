import 'package:enum_to_string/enum_to_string.dart';

enum BloodType {
  zeroPlus,
  zeroMinus,
  aPlus,
  aMinus,
  bPlus,
  bMinus,
  abPlus,
  abMinus,
}

extension BloodTypeExtension on BloodType {
  static List<String> getList() {
    List<String> bloodTypeList = [];
    for (var item in BloodType.values) {
      bloodTypeList.add(item.name);
    }
    return bloodTypeList;
  }

  String get getName {
    switch (this) {
      case BloodType.zeroPlus:
        return "0+";
      case BloodType.zeroMinus:
        return "0-";
      case BloodType.aPlus:
        return "A+";
      case BloodType.aMinus:
        return "A-";
      case BloodType.bPlus:
        return "B+";
      case BloodType.bMinus:
        return "B-";
      case BloodType.abPlus:
        return "AB+";
      case BloodType.abMinus:
        return "AB-";
      default:
        return "";
    }
  }
}

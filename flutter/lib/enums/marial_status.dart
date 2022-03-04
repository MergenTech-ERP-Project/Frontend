import 'package:enum_to_string/enum_to_string.dart';

enum MaritalStatus {
  married,
  single,
  unspecified,
}

extension MaritalStatusExtension on MaritalStatus {
  static List<String> getList() {
    List<String> maritalStatusList = [];
    for (var item in MaritalStatus.values) {
      maritalStatusList.add(item.name);
    }
    return maritalStatusList;
  }

  String get getNames {
    switch (this) {
      case MaritalStatus.married:
        return "Evli";
      case MaritalStatus.single:
        return "Bekar";
      case MaritalStatus.unspecified:
        return "Belirtilmemiş";
      default:
        return "";
    }
  }
}

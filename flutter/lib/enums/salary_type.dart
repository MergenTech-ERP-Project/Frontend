import 'package:enum_to_string/enum_to_string.dart';

enum SalaryType {
  net,
  gross,
}

extension SalaryTypeExtension on SalaryType {
  static List<String> getList() {
    List<String> salaryTypeList = [];
    for (var item in SalaryType.values) {
      salaryTypeList.add(item.name);
    }
    return salaryTypeList;
  }

  String get name {
    switch (this) {
      case SalaryType.net:
        return "Net";
      case SalaryType.gross:
        return "Brüt";

      default:
        return "";
    }
  }
}

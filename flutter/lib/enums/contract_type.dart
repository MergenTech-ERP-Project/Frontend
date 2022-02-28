import 'package:enum_to_string/enum_to_string.dart';

enum ContractType {
  timely,
  indenfinite,
}

extension ContractTypeExtension on ContractType {
  static List<String> getList() {
    List<String> contractTypeList = [];
    for (var item in ContractType.values) {
      contractTypeList.add(item.name);
    }
    return contractTypeList;
  }

  String get name {
    switch (this) {
      case ContractType.timely:
        return "Süreli";
      case ContractType.indenfinite:
        return "Süresiz";

      default:
        return "";
    }
  }
}

import 'package:enum_to_string/enum_to_string.dart';

///EnumToString.convertToString(item)

enum DepartmentsEnum {
  none,
  software,
  support,
  management,
}

extension DepartmentsEnumExtension on DepartmentsEnum {
  static List<String> getList() {
    List<String> departmentsEnumList = [];
    for (var item in DepartmentsEnum.values) {
      departmentsEnumList.add(item.getName);
    }
    return departmentsEnumList;
  }

  String get getName {
    switch (this) {
      case DepartmentsEnum.none:
        return "Yok";
      case DepartmentsEnum.software:
        return "Yazılım";
      case DepartmentsEnum.support:
        return "Destek";
      case DepartmentsEnum.management:
        return "Yönetim";
      default:
        return "";
    }
  }
}

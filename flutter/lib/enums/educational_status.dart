import 'package:enum_to_string/enum_to_string.dart';

enum EducationalStatus {
  student,
  graduate,
}

extension EducationalStatusExtension on EducationalStatus {
  static List<String> getList() {
    List<String> educationalStatusList = [];
    for (var item in EducationalStatus.values) {
      educationalStatusList.add(item.name);
    }
    return educationalStatusList;
  }

  String get name {
    switch (this) {
      case EducationalStatus.student:
        return "Öğrenci";
      case EducationalStatus.graduate:
        return "Mezun";

      default:
        return "";
    }
  }
}

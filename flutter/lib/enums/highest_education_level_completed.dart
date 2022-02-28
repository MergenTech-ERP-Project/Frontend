import 'package:enum_to_string/enum_to_string.dart';

enum HighestEducationLevelCompleted {
  primarySchool,
  middleSchool,
  highSchool,
  associateDegree,
  bachelorsDegree,
  mastersDegree,
  doctoratePhd,
  none,
}

extension HighestEducationLevelCompletedExtension
    on HighestEducationLevelCompleted {
  static List<String> getList() {
    List<String> highestEducationLevelCompletedList = [];
    for (var item in HighestEducationLevelCompleted.values) {
      highestEducationLevelCompletedList.add(item.name);
    }
    return highestEducationLevelCompletedList;
  }

  String get name {
    switch (this) {
      case HighestEducationLevelCompleted.primarySchool:
        return "İlkokul";
      case HighestEducationLevelCompleted.middleSchool:
        return "Ortaokul";
      case HighestEducationLevelCompleted.highSchool:
        return "Lise";
      case HighestEducationLevelCompleted.associateDegree:
        return "Ön Lisans";
      case HighestEducationLevelCompleted.bachelorsDegree:
        return "Lisans";
      case HighestEducationLevelCompleted.mastersDegree:
        return "Yüksek Lisans";
      case HighestEducationLevelCompleted.doctoratePhd:
        return "Doktora";
      case HighestEducationLevelCompleted.none:
        return "Yok";
      default:
        return "";
    }
  }
}

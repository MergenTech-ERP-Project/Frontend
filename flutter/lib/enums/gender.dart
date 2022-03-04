import 'package:enum_to_string/enum_to_string.dart';

enum Gender {
  male,
  female,
  unspecified,
}

extension GenderExtension on Gender {
  static List<String> getList() {
    List<String> genderList = [];
    for (var item in Gender.values) {
      genderList.add(item.name);
    }
    return genderList;
  }

  String get getName {
    switch (this) {
      case Gender.male:
        return "Erkek";
      case Gender.female:
        return "Kadın";
      case Gender.unspecified:
        return "Belirtilmemiş";

      default:
        return "";
    }
  }
}

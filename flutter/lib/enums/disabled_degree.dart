import 'package:enum_to_string/enum_to_string.dart';

enum DisabledDegree {
  none,
  firstDegreeDisabled,
  secondDegreeDisabled,
  thirdDegreeDisabled
}

extension DisabledDegreeExtension on DisabledDegree {
  static List<String> getList() {
    List<String> disabledDegreeList = [];
    for (var item in DisabledDegree.values) {
      disabledDegreeList.add(item.name);
    }
    return disabledDegreeList;
  }

  String get name {
    switch (this) {
      case DisabledDegree.none:
        return "Engeli Yok";
      case DisabledDegree.firstDegreeDisabled:
        return "1. Dereceden Engelli";
      case DisabledDegree.secondDegreeDisabled:
        return "2. Dereceden Engelli";
      case DisabledDegree.thirdDegreeDisabled:
        return "3. Dereceden Engelli";
      default:
        return "";
    }
  }
}

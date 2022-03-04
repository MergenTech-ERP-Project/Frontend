import 'package:enum_to_string/enum_to_string.dart';

enum TypeOfWorking {
  fullTime,
  partTime,
  temporary,
  contract,
  freelancer,
  intern,
  mobile,
}

extension TypeOfWorkingExtension on TypeOfWorking {
  static List<String> getList() {
    List<String> typeOfWorkingList = [];
    for (var item in TypeOfWorking.values) {
      typeOfWorkingList.add(item.name);
    }
    return typeOfWorkingList;
  }

  String get getName {
    switch (this) {
      case TypeOfWorking.fullTime:
        return "Tam Zamanlı";
      case TypeOfWorking.partTime:
        return "Yarı Zamanlı";
      case TypeOfWorking.temporary:
        return "Geçici";
      case TypeOfWorking.contract:
        return "Kontratlı";
      case TypeOfWorking.freelancer:
        return "Serbest Çalışan";
      case TypeOfWorking.intern:
        return "Stajyer";
      case TypeOfWorking.mobile:
        return "Gezici (Mobil)";
      default:
        return "";
    }
  }
}

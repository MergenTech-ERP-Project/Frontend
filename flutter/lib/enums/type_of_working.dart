enum EmploymentType {
  fullTime,
  partTime,
  temporary,
  contract,
  freelancer,
  intern,
  mobile,
}

extension TypeOfWorkingExtension on EmploymentType {
  static List<String> getList() {
    List<String> typeOfWorkingList = [];
    for (var item in EmploymentType.values) {
      typeOfWorkingList.add(item.getName);
    }
    return typeOfWorkingList;
  }

  String get getName {
    switch (this) {
      case EmploymentType.fullTime:
        return "Tam Zamanlı";
      case EmploymentType.partTime:
        return "Yarı Zamanlı";
      case EmploymentType.temporary:
        return "Geçici";
      case EmploymentType.contract:
        return "Kontratlı";
      case EmploymentType.freelancer:
        return "Serbest Çalışan";
      case EmploymentType.intern:
        return "Stajyer";
      case EmploymentType.mobile:
        return "Gezici (Mobil)";
      default:
        return "";
    }
  }
}

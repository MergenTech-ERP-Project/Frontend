enum EmploymentTypeEnum {
  fullTime,
  partTime,
  temporary,
  contract,
  freelancer,
  intern,
  mobile,
}

extension EmploymentTypeEnumExtension on EmploymentTypeEnum {
  static List<String> getList() {
    List<String> typeOfWorkingList = [];
    for (var item in EmploymentTypeEnum.values) {
      typeOfWorkingList.add(item.getName);
    }
    return typeOfWorkingList;
  }

  String get getName {
    switch (this) {
      case EmploymentTypeEnum.fullTime:
        return "Tam Zamanlı";
      case EmploymentTypeEnum.partTime:
        return "Yarı Zamanlı";
      case EmploymentTypeEnum.temporary:
        return "Geçici";
      case EmploymentTypeEnum.contract:
        return "Kontratlı";
      case EmploymentTypeEnum.freelancer:
        return "Serbest Çalışan";
      case EmploymentTypeEnum.intern:
        return "Stajyer";
      case EmploymentTypeEnum.mobile:
        return "Gezici (Mobil)";
      default:
        return "";
    }
  }

  static getEnumFromName(name) {
    return EmploymentTypeEnum
        .values[EmploymentTypeEnumExtension.getList().indexOf(name)];
  }
}

enum SalaryTypeEnum {
  none,
  net,
  gross,
}

extension SalaryTypeExtension on SalaryTypeEnum {
  static List<String> getList() {
    List<String> salaryTypeList = [];
    for (int i = 0; i < SalaryTypeEnum.values.length; i++) {
      salaryTypeList.add(SalaryTypeEnum.values[i].getName);
    }
    return salaryTypeList;
  }

  String get getName {
    switch (this) {
      case SalaryTypeEnum.none:
        return "seçiniz...";
      case SalaryTypeEnum.net:
        return "Net";
      case SalaryTypeEnum.gross:
        return "Brüt";

      default:
        return "";
    }
  }

  static getEnumFromName(name) {
    return SalaryTypeEnum.values[SalaryTypeExtension.getList().indexOf(name)];
  }
}

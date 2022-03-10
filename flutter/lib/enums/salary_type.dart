enum SalaryTypeEnum {
  net,
  gross,
}

extension SalaryTypeExtension on SalaryTypeEnum {
  static List<String> getList() {
    List<String> salaryTypeList = [];
    for (var item in SalaryTypeEnum.values) {
      salaryTypeList.add(item.getName);
    }
    return salaryTypeList;
  }

  String get getName {
    switch (this) {
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

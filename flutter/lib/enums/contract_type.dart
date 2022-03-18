enum ContractTypeEnum {
  none,
  timely,
  indenfinite,
}

extension ContractTypeExtension on ContractTypeEnum {
  static List<String> getList() {
    List<String> contractTypeList = [];
    for (int i = 0; i < ContractTypeEnum.values.length; i++) {
      contractTypeList.add(ContractTypeEnum.values[i].getName);
    }
    return contractTypeList;
  }

  String get getName {
    switch (this) {
      case ContractTypeEnum.none:
        return "seçiniz...";
      case ContractTypeEnum.timely:
        return "Süreli";
      case ContractTypeEnum.indenfinite:
        return "Süresiz";

      default:
        return "";
    }
  }

  static getEnumFromName(name) {
    return ContractTypeEnum
        .values[ContractTypeExtension.getList().indexOf(name)];
  }
}

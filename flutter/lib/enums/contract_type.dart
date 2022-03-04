
enum ContractTypeEnum {
  timely,
  indenfinite,
}

extension ContractTypeExtension on ContractTypeEnum {
  static List<String> getList() {
    List<String> contractTypeList = [];
    for (var item in ContractTypeEnum.values) {
      contractTypeList.add(item.getName);
    }
    return contractTypeList;
  }

  String get getName {
    switch (this) {
      case ContractTypeEnum.timely:
        return "Süreli";
      case ContractTypeEnum.indenfinite:
        return "Süresiz";

      default:
        return "";
    }
  }
}

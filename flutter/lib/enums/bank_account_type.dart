enum BankAccountTypeEnum {
  drawingAccount,
  checkAccount,
  other,
}

extension BankAccountTypeExtension on BankAccountTypeEnum {
  static List<String> getList() {
    List<String> bankAccountTypeList = [];
    for (var item in BankAccountTypeEnum.values) {
      bankAccountTypeList.add(item.getName);
    }
    return bankAccountTypeList;
  }

  String get getName {
    switch (this) {
      case BankAccountTypeEnum.drawingAccount:
        return "Vadesiz Hesap";
      case BankAccountTypeEnum.checkAccount:
        return "Çek Hesabı";
      case BankAccountTypeEnum.other:
        return "Diğer";

      default:
        return "";
    }
  }

  static getEnumFromName(name) {
    return BankAccountTypeEnum
        .values[BankAccountTypeExtension.getList().indexOf(name)];
  }
}

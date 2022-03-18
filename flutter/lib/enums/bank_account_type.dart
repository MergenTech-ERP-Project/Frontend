enum BankAccountTypeEnum {
  none,
  drawingAccount,
  checkAccount,
  other,
}

extension BankAccountTypeExtension on BankAccountTypeEnum {
  static List<String> getList() {
    List<String> bankAccountTypeList = [];
    for (int i = 0; i < BankAccountTypeEnum.values.length; i++) {
      bankAccountTypeList.add(BankAccountTypeEnum.values[i].getName);
    }
    return bankAccountTypeList;
  }

  String get getName {
    switch (this) {
      case BankAccountTypeEnum.none:
        return "seçiniz...";
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

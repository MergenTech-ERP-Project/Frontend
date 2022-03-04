
enum BankAccountTypeEnum {
  drawingAccount,
  checkAccount,
  other,
}

extension AccountTypeExtension on BankAccountTypeEnum {
  static List<String> getList() {
    List<String> accountTypeList = [];
    for (var item in BankAccountTypeEnum.values) {
      accountTypeList.add(item.getName);
    }
    return accountTypeList;
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
}

import 'package:enum_to_string/enum_to_string.dart';

enum BankAccountType {
  drawingAccount,
  checkAccount,
  other,
}

extension AccountTypeExtension on BankAccountType {
  static List<String> getList() {
    List<String> accountTypeList = [];
    for (var item in BankAccountType.values) {
      accountTypeList.add(item.name);
    }
    return accountTypeList;
  }

  String get getName {
    switch (this) {
      case BankAccountType.drawingAccount:
        return "Vadesiz Hesap";
      case BankAccountType.checkAccount:
        return "Çek Hesabı";
      case BankAccountType.other:
        return "Diğer";

      default:
        return "";
    }
  }
}

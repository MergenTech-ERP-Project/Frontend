import 'package:enum_to_string/enum_to_string.dart';

enum AccountType {
  drawingAccount,
  checkAccount,
  other,
}

extension AccountTypeExtension on AccountType {
  static List<String> getList() {
    List<String> accountTypeList = [];
    for (var item in AccountType.values) {
      accountTypeList.add(item.name);
    }
    return accountTypeList;
  }

  String get name {
    switch (this) {
      case AccountType.drawingAccount:
        return "Vadesiz Hesap";
      case AccountType.checkAccount:
        return "Çek Hesabı";
      case AccountType.other:
        return "Diğer";

      default:
        return "";
    }
  }
}

import 'package:enum_to_string/enum_to_string.dart';

enum PaymentScheme {
  yearly,
  monthly,
  weekly,
  daily,
  hourly,
}

extension PaymentSchemeExtension on PaymentScheme {
  static List<String> getList() {
    List<String> maritalStatusList = [];
    for (var item in PaymentScheme.values) {
      maritalStatusList.add(item.name);
    }
    return maritalStatusList;
  }

  String get name {
    switch (this) {
      case PaymentScheme.yearly:
        return "Yıllık";
      case PaymentScheme.monthly:
        return "Aylık";
      case PaymentScheme.weekly:
        return "Haftalık";
      case PaymentScheme.daily:
        return "Günlük";
      case PaymentScheme.hourly:
        return "Saatlik";
      default:
        return "";
    }
  }
}

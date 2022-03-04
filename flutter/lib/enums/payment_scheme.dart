
enum PaymentSchemeEnum {
  yearly,
  monthly,
  weekly,
  daily,
  hourly,
}

extension PaymentSchemeExtension on PaymentSchemeEnum {
  static List<String> getList() {
    List<String> maritalStatusList = [];
    for (var item in PaymentSchemeEnum.values) {
      maritalStatusList.add(item.getName);
    }
    return maritalStatusList;
  }

  String get getName {
    switch (this) {
      case PaymentSchemeEnum.yearly:
        return "Yıllık";
      case PaymentSchemeEnum.monthly:
        return "Aylık";
      case PaymentSchemeEnum.weekly:
        return "Haftalık";
      case PaymentSchemeEnum.daily:
        return "Günlük";
      case PaymentSchemeEnum.hourly:
        return "Saatlik";
      default:
        return "";
    }
  }
}

enum PaymentSchemeEnum {
  yearly,
  monthly,
  weekly,
  daily,
  hourly,
}

extension PaymentSchemeExtension on PaymentSchemeEnum {
  static List<String> getList() {
    List<String> paymentSchemeList = [];
    for (var item in PaymentSchemeEnum.values) {
      paymentSchemeList.add(item.getName);
    }
    return paymentSchemeList;
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

  static getEnumFromName(name) {
    return PaymentSchemeEnum
        .values[PaymentSchemeExtension.getList().indexOf(name)];
  }
}

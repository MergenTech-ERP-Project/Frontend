enum PaymentSchemeEnum {
  none,
  yearly,
  monthly,
  weekly,
  daily,
  hourly,
}

extension PaymentSchemeExtension on PaymentSchemeEnum {
  static List<String> getList() {
    List<String> paymentSchemeList = [];
    for (int i = 0; i < PaymentSchemeEnum.values.length; i++) {
      paymentSchemeList.add(PaymentSchemeEnum.values[i].getName);
    }
    return paymentSchemeList;
  }

  String get getName {
    switch (this) {
      case PaymentSchemeEnum.none:
        return "seçiniz...";
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

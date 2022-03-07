enum BankNamesEnum {
  halkBank,
  vakifBank,
  ziraatBank,
  akBank,
  anadoluBank,
  fibabank,
  sekerbank,
  turkishbank,
  turkEkonomiBank,
  turkiyeIsBankasi,
  yapiKrediBankasi,
  adaBank,
  birlesikFonBankasi,
  illerBankasi,
  turkEximbank,
  turkiyeEmlakKatilim,
  vakifKatilim,
  ziraatKatilim,
  albaraTurk,
}

extension BankNamesEnumExtension on BankNamesEnum {
  static List<String> getList() {
    List<String> accountTypeList = [];
    for (var item in BankNamesEnum.values) {
      accountTypeList.add(item.getName);
    }
    return accountTypeList;
  }

  String get getName {
    switch (this) {
      case BankNamesEnum.halkBank:
        return "Halk Bankası";
      case BankNamesEnum.vakifBank:
        return "Vakıfbank";
      case BankNamesEnum.ziraatBank:
        return "Ziraat Bankası";
      case BankNamesEnum.akBank:
        return "Akbank";
      case BankNamesEnum.anadoluBank:
        return "Anadolu Bankası";
      case BankNamesEnum.fibabank:
        return "Fibabank";
      case BankNamesEnum.sekerbank:
        return "Şeker Bank";
      case BankNamesEnum.turkishbank:
        return "TurkishBank";
      case BankNamesEnum.turkEkonomiBank:
        return "Türk Ekonomi Bankası";
      case BankNamesEnum.turkiyeIsBankasi:
        return "Türkiye İş Bankası";
      case BankNamesEnum.yapiKrediBankasi:
        return "Yapı Kredi Bankası";
      case BankNamesEnum.adaBank:
        return "AdaBank";
      case BankNamesEnum.birlesikFonBankasi:
        return "Birleşik Fon Bankası";
      case BankNamesEnum.illerBankasi:
        return "İller Bankası";
      case BankNamesEnum.turkEximbank:
        return "Turk Eximbank";
      case BankNamesEnum.turkiyeEmlakKatilim:
        return "Türkiye Emlak Katılım";
      case BankNamesEnum.vakifKatilim:
        return "Vakıf Katılım";
      case BankNamesEnum.ziraatKatilim:
        return "Ziraat Katılım";
      case BankNamesEnum.albaraTurk:
        return "Albara Turk";

      default:
        return "";
    }
  }
}

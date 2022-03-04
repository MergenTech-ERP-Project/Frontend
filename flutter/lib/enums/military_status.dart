import 'package:enum_to_string/enum_to_string.dart';

enum MilitaryStatus {
  done,
  notDone,
  exempt,
  deferred,
}

extension MaritalStatusExtension on MilitaryStatus {
  static List<String> getList() {
    List<String> militaryStatusList = [];
    for (var item in MilitaryStatus.values) {
      militaryStatusList.add(item.name);
    }
    return militaryStatusList;
  }

  String get getName {
    switch (this) {
      case MilitaryStatus.done:
        return "Yapıldı";
      case MilitaryStatus.notDone:
        return "Yapılmadı";
      case MilitaryStatus.exempt:
        return "Muaf";
      case MilitaryStatus.deferred:
        return "Tecilli";
      default:
        return "";
    }
  }
}

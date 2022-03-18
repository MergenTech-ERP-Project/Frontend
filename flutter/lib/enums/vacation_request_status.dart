enum VacationRequestStatusEnum {
  approved,
  unapproved,
  pendingApproval,
}

extension VacationRequestStatusEnumExtension on VacationRequestStatusEnum {
  static List<String> getList() {
    List<String> vacationList = [];
    for (var item in VacationRequestStatusEnum.values) {
      vacationList.add(item.getName);
    }
    return vacationList;
  }

  String get getName {
    switch (this) {
      case VacationRequestStatusEnum.approved:
        return "Onaylandı";
      case VacationRequestStatusEnum.unapproved:
        return "Onaylanmadı";
      case VacationRequestStatusEnum.pendingApproval:
        return "Onay Bekliyor";

      default:
        return "";
    }
  }

  static getEnumFromName(name) {
    return VacationRequestStatusEnum
        .values[VacationRequestStatusEnumExtension.getList().indexOf(name)];
  }
}

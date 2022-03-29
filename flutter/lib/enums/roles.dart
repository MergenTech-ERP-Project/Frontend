enum RolesEnum { user, moderator, admin }

extension RolesEnumExtension on RolesEnum {
  static List<String> getList() {
    List<String> rolesEnumList = [];
    for (int i = 0; i < RolesEnum.values.length; i++) {
      rolesEnumList.add(RolesEnum.values[i].getName);
    }
    return rolesEnumList;
  }

  String get getName {
    switch (this) {
      case RolesEnum.user:
        return "User";
      case RolesEnum.moderator:
        return "Moderator";
      case RolesEnum.admin:
        return "Admin";

      default:
        return "";
    }
  }

  static getEnumFromName(name) {
    return RolesEnum.values[RolesEnumExtension.getList().indexOf(name)];
  }
}

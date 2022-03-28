import 'dart:convert';

List<UserDetailCareer> parseUsersDetailCareer(String str) =>
    List<UserDetailCareer>.from(
        json.decode(str).map((x) => UserDetailCareer.fromJson(x)));

UserDetailCareer parseUserCareer(String str) => parseUsersDetailCareer(str)[0];

String fetchUsers(List<UserDetailCareer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// The part written with // places written with json.

class UserDetailCareer {
  int id;
  int userDetailId; //user_detail_id
  String adminName; //admin_name
  String adminTcno; //admin_tc_no
  String unitCompany; //unit_company
  String unitBranch; //unit_branch
  String unitDepartment; //unit_department
  String unitTitle; //unit_title

  UserDetailCareer({
    this.id = -1,
    required this.userDetailId,
    this.adminName = "",
    this.adminTcno = "",
    this.unitCompany = "",
    this.unitBranch = "",
    this.unitDepartment = "",
    this.unitTitle = "",
  });

  factory UserDetailCareer.fromJson(Map<String, dynamic> json) {
    return UserDetailCareer(
      id: json['id'] ?? -1,
      userDetailId: json["user_detail_id"] ?? -1,
      adminName: json['admin_name'] ?? "",
      adminTcno: json['admin_tc_no'] ?? "",
      unitCompany: json['unit_company'] ?? "",
      unitBranch: json['unit_branch'] ?? "",
      unitDepartment: json['unit_department'] ?? "",
      unitTitle: json['unit_title'] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_detail_id": userDetailId,
        "admin_name": adminName,
        "admin_tc_no": adminTcno,
        "unit_company": unitCompany,
        "unit_branch": unitBranch,
        "unit_department": unitDepartment,
        "unit_title": unitTitle,
      };
}

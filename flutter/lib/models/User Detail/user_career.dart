import 'dart:convert';

List<UserDetailCareer> parseUsers(String str) =>
    List<UserDetailCareer>.from(json.decode(str).map((x) => UserDetailCareer.fromJson(x)));

UserDetailCareer parseUserCareer(String str) => parseUsers(str)[0];

String fetchUsers(List<UserDetailCareer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// The part written with // places written with json.

class UserDetailCareer {
  final String? tcno; //tcno
  final String? managerName; //manager_name
  final String? managerTcno; //manager_tcno
  final String? unitCompany; //unit_company
  final String? unitBranch; //unit_branch
  final String? unitDepartment; //unit_department
  final String? unitTitle; //unit_title

  UserDetailCareer({
    this.tcno,
    this.managerName,
    this.managerTcno,
    this.unitCompany,
    this.unitBranch,
    this.unitDepartment,
    this.unitTitle,
  });

  factory UserDetailCareer.fromJson(Map<String, dynamic> json) {
    return UserDetailCareer(
      tcno: json['tcno'],
      managerName: json['manager_name'],
      managerTcno: json['manager_tcno'],
      unitCompany: json['unit_company'],
      unitBranch: json['unit_branch'],
      unitDepartment: json['unit_department'],
      unitTitle: json['unit_title'],
    );
  }

  Map<String, dynamic> toJson() => {
        "tcno": tcno,
        "manager_name": managerName,
        "manager_tcno": managerTcno,
        "unit_company": unitCompany,
        "unit_branch": unitBranch,
        "unit_department": unitDepartment,
        "unit_title": unitTitle,
      };
}

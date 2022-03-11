import 'dart:convert';

List<Branch> branchFromJson(String str) =>
    List<Branch>.from(json.decode(str).map((x) => Branch.fromMap(x)));

String branchToJson(List<Branch> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Branch {
  final int id;
  final int companyId;
  String branchName;
  String branchUpper;
  String rules;
  String vacationDates;

  Branch({
    this.id = 0,
    required this.companyId,
    this.branchName = "",
    this.branchUpper = "",
    this.rules = "",
    this.vacationDates = "",
  });

  factory Branch.fromMap(Map json) {
    return Branch(
      id: json['id'],
      companyId: json['company_id'],
      branchName: json['branch_name'],
      branchUpper: json['branch_upper'],
      rules: json['rules'],
      vacationDates: json['vacation_dates'],
    );
  }

  Map toJson() => {
        'id': id,
        'company_id': companyId,
        'branch_name': branchName,
        'branch_upper': branchUpper,
        'rules': rules,
        'vacation_dates': vacationDates,
      };
}

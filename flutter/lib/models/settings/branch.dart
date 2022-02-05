import 'dart:convert';

List<Branch> branchFromJson(String str) =>
  List<Branch>.from(json.decode(str).map((x) => Branch.fromMap(x)));

String branchToJson(List<Branch> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJsonWithId())));

class Branch {
  final int id;
  String branch_name;
  String branch_upper;
  String rules;
  String vacation_dates;

  Branch({
    this.id = 0,
    this.branch_name = "",
    this.branch_upper = "",
    this.rules = "",
    this.vacation_dates = "",
  });

  factory Branch.fromMap(Map branchMap) {
    return Branch(
      id: branchMap['id'],
      branch_name: branchMap['branch_name'],
      branch_upper: branchMap['branch_upper'],
      rules: branchMap['rules'],
      vacation_dates: branchMap['vacation_dates'],
    );
  }

  Map toJson() => {
    'branch_name': branch_name,
    'branch_upper': branch_upper,
    'rules': rules,
    'vacation_dates': vacation_dates,
  };

  Map toJsonWithId() => {
    'id': id,
    'branch_name': branch_name,
    'branch_upper': branch_upper,
    'rules': rules,
    'vacation_dates': vacation_dates,
  };
}

import 'dart:convert';

List<Branch> branchFromJson(String str) =>
  List<Branch>.from(json.decode(str).map((x) => Branch.fromMap(x)));

String branchToJson(List<Branch> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJsonWithId())));

class Branch {
  final int id;
  String branchName;
  String branchUpper;
  String rules;
  String vacationDates;

  Branch({
    this.id = 0,
    this.branchName = "",
    this.branchUpper = "",
    this.rules = "",
    this.vacationDates = "",
  });

  factory Branch.fromMap(Map branchMap) {
    return Branch(
      id: branchMap['id'],
      branchName: branchMap['branch_name'],
      branchUpper: branchMap['branch_upper'],
      rules: branchMap['rules'],
      vacationDates: branchMap['vacation_dates'],
    );
  }

  Map toJson() => {
    'branch_name': branchName,
    'branch_upper': branchUpper,
    'rules': rules,
    'vacation_dates': vacationDates,
  };

  Map toJsonWithId() => {
    'id': id,
    'branch_name': branchName,
    'branch_upper': branchUpper,
    'rules': rules,
    'vacation_dates': vacationDates,
  };
}

import 'dart:convert';

List<Department> departmentFromJson(String str) =>
    List<Department>.from(json.decode(str).map((x) => Department.fromMap(x)));

String departmentToJson(List<Department> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Department {
  final int id;
  final int branchId;
  String departmentName;

  Department({
    this.id = 0,
    required this.branchId,
    this.departmentName = "",
  });

  factory Department.fromMap(Map json) {
    return Department(
      id: json['id'],
      branchId: json['branch_id'],
      departmentName: json['department_name'],
    );
  }

  Map toJson() => {
        'id': id,
        'branch_id': branchId,
        'department_name': departmentName,
      };
}

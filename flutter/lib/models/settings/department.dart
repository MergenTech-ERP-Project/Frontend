import 'dart:convert';

List<Department> departmentFromJson(String str) =>
    List<Department>.from(json.decode(str).map((x) => Department.fromMap(x)));

String departmentToJson(List<Department> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJsonWithId())));

class Department {
  final int id;
  String departmentName;

  Department({
    this.id = 0,
    this.departmentName = "",
  });

  factory Department.fromMap(Map map) {
    return Department(
      id: map['id'],
      departmentName: map['department_name'],
    );
  }

  Map toJson() => {
        'department_name': departmentName,
      };

  Map toJsonWithId() => {
        'id': id,
        'department_name': departmentName,
      };
}

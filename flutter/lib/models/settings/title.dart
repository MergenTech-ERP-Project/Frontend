import 'dart:convert';

List<Titlee> titleFromJson(String str) =>
    List<Titlee>.from(json.decode(str).map((x) => Titlee.fromMap(x)));

String titleToJson(List<Titlee> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Titlee {
  final int id;
  final int departmentId;
  String titleName;

  Titlee({
    this.id = 0,
    required this.departmentId,
    this.titleName = "",
  });

  factory Titlee.fromMap(Map json) {
    return Titlee(
      id: json['id'],
      departmentId: json['department_id'],
      titleName: json['title_name'],
    );
  }

  Map toJson() => {
        'id': id,
        'department_id': departmentId,
        'title_name': titleName,
      };
}

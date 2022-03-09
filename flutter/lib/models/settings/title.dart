import 'dart:convert';

List<Titlee> titleFromJson(String str) =>
    List<Titlee>.from(json.decode(str).map((x) => Titlee.fromMap(x)));

String titleToJson(List<Titlee> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJsonWithId())));

class Titlee {
  final int id;
  String titleName;

  Titlee({
    this.id = 0,
    this.titleName = "",
  });

  factory Titlee.fromMap(Map companyMap) {
    return Titlee(
      id: companyMap['id'],
      titleName: companyMap['title_name'],
    );
  }

  Map toJson() => {
        'title_name': titleName,
      };

  Map toJsonWithId() => {
        'id': id,
        'title_name': titleName,
      };
}

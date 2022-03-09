import 'dart:convert';

List<Title> titleFromJson(String str) =>
    List<Title>.from(json.decode(str).map((x) => Title.fromMap(x)));

String titleToJson(List<Title> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJsonWithId())));

class Title {
  final int id;
  String titleName;

  Title({
    this.id = 0,
    this.titleName = "",
  });

  factory Title.fromMap(Map companyMap) {
    return Title(
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

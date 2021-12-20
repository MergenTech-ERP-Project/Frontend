import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';

enum Departmans {
  none,
  software,
  support,
  management,
}

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromMap(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJsonWithId())));

class User {
  final int id;
  final String name;
  final Departmans title;
  final String password;

  User({
    required this.id,
    required this.name,
    required this.title,
    required this.password,
  });

  factory User.fromMap(Map userMap) {
    return User(
      id: userMap['id'],
      name: userMap['name'],
      title: EnumToString.fromString(Departmans.values, userMap['title'])!,
      password: userMap['password'],
    );
  }

  Map toJson() => {
        'name': name,
        'title': EnumToString.convertToString(title),
        'password': password,
      };

  Map toJsonWithId() => {
        "id": id,
        "name": name,
        "title": EnumToString.convertToString(title),
        "password": password,
      };

  String getDepartmant() => EnumToString.convertToString(this.title);
}

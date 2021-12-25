import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';

import 'departments_enum.dart';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromMap(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJsonWithId())));

class User {
  final int id;
  final String name;
  final Departments title;
  final String password;

  User({
    this.id = 0,
    this.name = "",
    this.title = Departments.none,
    this.password = "",
  });

  factory User.fromMap(Map userMap) {
    return User(
      id: userMap['id'],
      name: userMap['name'],
      title: EnumToString.fromString(Departments.values, userMap['title'])!,
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

  String getDepartment() => EnumToString.convertToString(title);
}

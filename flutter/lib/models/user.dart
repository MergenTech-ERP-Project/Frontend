import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';

import '../enums/departments_enum.dart';

List<User> parseUsers(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

User parseUser(String str) => parseUsers(str)[0];

String fetchUsers(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  final int id;
  String name;
  DepartmentsEnum title;
  String password;

  User({
    this.id = 0,
    this.name = "",
    this.title = DepartmentsEnum.none,
    this.password = "",
  });

  String getDepartment() => EnumToString.convertToString(title);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        password: json['password'],
        title: EnumToString.fromString(DepartmentsEnum.values, json['title'])!
        //title: json['title'] != null ? EnumToString.fromString(DepartmentsEnum.values, json['title'])! : null,
        );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "title": EnumToString.convertToString(title),
        "password": password,
      };
}

import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';

List<UserDetail> parseUsers(String str) =>
    List<UserDetail>.from(json.decode(str).map((x) => UserDetail.fromJson(x)));

UserDetail parseUser(String str) => parseUsers(str)[0];

String fetchUsers(List<UserDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDetail {
  final int id;

  UserDetail({
    this.id = 0,
  });

  String getDepartment() => EnumToString.convertToString("a");

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

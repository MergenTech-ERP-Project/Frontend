import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(utf8.decode(utf8.encode(str))).map((x) => User.fromMap(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJsonWithId())));

class User {
  final int id;
  final String name;
  final String title;
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
      title: userMap['title'],
      password: userMap['password'],
    );
  }

  Map toJson() => {
        'name': name,
        'title': title,
        'password': password,
      };

  Map toJsonWithId() => {
    "id": id,
    "name": name,
    "title": title,
    "password": password,
  };
}

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromMap(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
        "id": id,
        "name": name,
        "title": title,
        "password": password,
      };
}

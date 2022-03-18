import 'dart:convert';

List<User>? parseUsers(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

User? parseUser(String str) => parseUsers(str)?[0];

String fetchUsers(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  final int id;
  String name;
  String password;
  String title;
  String cellphone;
  String email;

  User({
    this.id = 0,
    this.name = "",
    this.password = "",
    this.title = "",
    this.cellphone = "",
    this.email = "",
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? -1,
      name: json['name'] ?? "",
      password: json['password'] ?? "",
      title: json['title'] ?? "",
      cellphone: json['cellphone'] ?? "",
      email: json['email'] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "password": password,
        "title": title,
        "cellphone": cellphone,
        "email": email,
      };
}

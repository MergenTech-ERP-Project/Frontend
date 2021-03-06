import 'dart:convert';

List<User> parseUsers(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

User? parseUser(String str) {
  List<User> users = parseUsers(str);
  return users.isNotEmpty ? users[0] : null;
}

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
    this.id = -1,
    this.name = "",
    this.password = "",
    this.title = "",
    this.cellphone = "",
    this.email = "",
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? -1,
      name: json['username'] ?? "",
      password: json['password'] ?? "",
      title: json['title'] ?? "",
      cellphone: json['cellphone'] ?? "",
      email: json['email'] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": name,
        "email": email,
        "password": password,
        "title": title,
        "cellphone": cellphone,
      };
}

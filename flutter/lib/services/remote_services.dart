import 'package:http/http.dart' as http;
import 'package:vtys_kalite/models/user.dart';

class RemoteServices {
  static Future<List<User>?> fetchUsers() async {
    var response = await http.get(Uri.parse('http://127.0.0.1:8080/user/users'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return userFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<int> fetchUser(String name, String password) async {
    var response = await http.get(Uri.parse('http://127.0.0.1:8080/user/users'));
    int user = -1;
    if (response.statusCode == 200) {
      var jsonString = response.body;
      userFromJson(jsonString).map((e) => { if(e.name == name && e.password == password) user = e.id });
    }
    print(user.toString());
    return user;
  }

  static Future<String> postUser(String json) async {
    var response = await http.post(Uri.parse('http://127.0.0.1:8080/user/post'), body: json);
    return response.statusCode == 200 ? "Success: User" : "Error: User";
  }
}

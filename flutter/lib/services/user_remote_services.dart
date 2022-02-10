import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/user.dart';

class UserRemoteServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<List<User>?> fetchUsers() async {
    var response = await http.get(Uri.parse(
        Statics.instance.serviceHttp + '/user/users'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return userFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<int> fetchUser(String name, String password) async {
    var response = await http.get(Uri.parse(
        Statics.instance.serviceHttp + '/user/users'));
    int userID = -1;
    if (response.statusCode == 200) {
      var jsonString = response.body;
      List<User> users = userFromJson(jsonString);
      for (User user in users) {
        if (user.name == name && user.password == password) {
          userID = users.indexOf(user);
          print(userID);
          break;
        }
      }
      print(userID);
    }
    return userID;
  }

  static Future<String> postUser(String json) async {
    print("Json: $json");
    var response = await http
        .post(
            Uri.parse(
                Statics.instance.serviceHttp + '/user/post'),
            headers: <String, String>{
              'Content-type': 'application/json',
              'Accept': 'application/json',
              //'Authorization': '<Your token>'
            },
            body: json,
            encoding: encoding)
        .timeout(
          const Duration(seconds: 10),
        );
    return response.statusCode == 200
        ? "Success: User"
        : "Error: User ${response.statusCode}";
  }

  static Future<String> putUser(int id, String json) async {
    print("Json: $json");
    var response = await http
        .put(
            Uri.parse(
                Statics.instance.serviceHttp + '/user/put/$id'),
            headers: <String, String>{
              'Content-type': 'application/json',
              'Accept': 'application/json',
              //'Authorization': '<Your token>'
            },
            body: json,
            encoding: encoding)
        .timeout(
          const Duration(seconds: 10),
        );
    return response.statusCode == 200
        ? "Success: User"
        : "Error: User ${response.statusCode}";
  }

  static Future<String> deleteUser(int id) async {
    var response = await http
        .delete(
            Uri.parse(
                Statics.instance.serviceHttp + '/user/delete/$id'),
            headers: <String, String>{
              'Content-type': 'application/json',
              'Accept': 'application/json',
              //'Authorization': '<Your token>'
            },
            encoding: encoding)
        .timeout(
          const Duration(seconds: 10),
        );
    return response.statusCode == 200
        ? "Success: User"
        : "Error: User ${response.statusCode}";
  }
}

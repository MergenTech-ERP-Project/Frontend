import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/routing/routes.dart';

class UserRemoteServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<List<User>?> fetchUsers() async {
    var response = await http.get(Uri.parse(serviceHttp + '/user/users'));
    if (response.statusCode == 200) {
      var jsonString = response.body.toString();
      return parseUsers(jsonString);
    } else {
      return null;
    }
  }

  static Future<int> fetchUserByName(String name) async {
    var response = await http.get(Uri.parse(serviceHttp + '/user/$name'));
    int userID = -1;
    if (response.statusCode == 200) {
      var jsonString = response.body.toString();
      if (jsonString == "null") {
        return userID;
      }
      jsonString = "[" + jsonString + "]";
      userID = parseUser(jsonString).id;
    }
    return userID;
  }

  static Future<int> fetchUserByNameAndPassword(
      String name, String password) async {
    var response =
        await http.get(Uri.parse(serviceHttp + '/user/$name/$password'));
    int userID = -1;
    if (response.statusCode == 200) {
      String jsonString = response.body.toString();
      if (jsonString == "null") {
        return userID;
      }
      jsonString = "[" + jsonString + "]";
      userID = parseUser(jsonString).id;
    }
    return userID;
  }

  static Future<String> addNewUser(String json) async {
    var response = await http
        .post(Uri.parse(serviceHttp + '/user/post'),
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

  static Future<String> updateUser(int id, String json) async {
    var response = await http
        .put(Uri.parse(serviceHttp + '/user/put/$id'),
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
        .delete(Uri.parse(serviceHttp + '/user/delete/$id'),
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

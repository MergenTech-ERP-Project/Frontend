import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vtys_kalite/models/settings/title.dart';
import 'package:vtys_kalite/routing/routes.dart';

class TitleRemoteServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<List<Titlee>?> fetchTitles() async {
    var response = await http.get(Uri.parse(serviceHttp + '/title/list'));
    if (response.statusCode == 200) {
      var jsonString = utf8.decode(response.bodyBytes);
      return titleFromJson(jsonString);
    } else {
      return null;
    }
  }

  /* static Future<int> fetchTitle(companyId, branchId, departmentId) async {
    var response = await http.get(
        Uri.parse(serviceHttp + '/Title/$companyId/$branchId/$departmentId'));
    int titleId = -1;
    if (response.statusCode == 200) {
      var jsonString = utf8.decode(response.bodyBytes);
      List<Title> companies = titleFromJson(jsonString);
      for (Title title in companies) {
        if (title.titleName == TitleName) {
          titleId = companies.indexOf(title);
          break;
        }
      }
    }
    return titleId;
  } */

  static Future<String> newTitle(String json) async {
    var response = await http
        .post(
          Uri.parse(serviceHttp + '/title/new'),
          headers: <String, String>{
            'Content-type': 'application/json',
            'Accept': 'application/json',
          },
          body: json,
          encoding: encoding,
        )
        .timeout(
          const Duration(seconds: 10),
        );
    return response.statusCode == 200
        ? "Success: Title"
        : "Error: Title ${response.statusCode}";
  }

  static Future<String> updateTitle(int id, String json) async {
    var response = await http
        .put(
          Uri.parse(serviceHttp + "/title/update/$id"),
          headers: <String, String>{
            'Content-type': 'application/json',
            'Accept': 'application/json',
          },
          body: json,
          encoding: encoding,
        )
        .timeout(
          const Duration(seconds: 10),
        );
    return response.statusCode == 200
        ? "Success: Title"
        : "Error: Title ${response.statusCode}";
  }

  static Future<String> removeTitle(int id) async {
    var response = await http
        .delete(
          Uri.parse(serviceHttp + '/title/remove/$id'),
          headers: <String, String>{
            'Content-type': 'application/json',
            'Accept': 'application/json',
          },
          encoding: encoding,
        )
        .timeout(
          const Duration(seconds: 10),
        );
    return response.statusCode == 200
        ? "Success: Title"
        : "Error: Title ${response.statusCode}";
  }
}

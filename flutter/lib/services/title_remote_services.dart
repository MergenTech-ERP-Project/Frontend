// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/settings/title.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class TitleRemoteServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<List<Titlee>?> fetchTitles() async {
    var response =
        await http.get(Uri.parse(serviceHttp + '/title/list'), headers: {
      'Authorization': '${securityUser.tokenType} ${securityUser.accessToken}',
    });
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      print(response.body);
      List<Titlee> titles = titleFromJson(jsonString);

      return titles;
    } else if (response.statusCode == 401) {
      securityUserController.refreshToken(securityUser);
      return fetchTitles();
    } else {
      return null;
    }
  }

  static Future<List<Titlee>?> fetchTitleByDepartmentId(departmentId) async {
    var response = await http.get(
        Uri.parse(serviceHttp + '/title/find/department:$departmentId'),
        headers: {
          'Authorization':
              '${securityUser.tokenType} ${securityUser.accessToken}',
        });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      return titleFromJson(jsonString);
    } else if (response.statusCode == 401) {
      securityUserController.refreshToken(securityUser);
      return fetchTitleByDepartmentId(departmentId);
    } else {
      return null;
    }
  }

  static Future<String> addNewTitle(String json) async {
    var response = await http
        .post(
          Uri.parse(serviceHttp + '/title/new'),
          headers: <String, String>{
            'Content-type': 'application/json',
            'Accept': 'application/json',
            'Authorization':
                '${securityUser.tokenType} ${securityUser.accessToken}',
          },
          body: json,
          encoding: encoding,
        )
        .timeout(
          const Duration(seconds: 10),
        );
    if (response.statusCode == 401) {
      await securityUserController.refreshToken(securityUser);
      print("refresh Token: ${securityUser.refreshToken}");
      return addNewTitle(json);
    }
    return response.statusCode >= 200 && response.statusCode < 300
        ? "Success: Title"
        : "Error: Title ${response.statusCode}";
  }

  static Future<String> updateTitle(int id, String json) async {
    print("OMEEEEEEERRRRRRR update");
    var response = await http
        .put(
          Uri.parse(serviceHttp + "/title/update/$id"),
          headers: <String, String>{
            'Content-type': 'application/json',
            'Accept': 'application/json',
            'Authorization':
                '${securityUser.tokenType} ${securityUser.accessToken}',
          },
          body: json,
          encoding: encoding,
        )
        .timeout(
          const Duration(seconds: 10),
        );
    if (response.statusCode == 401) {
      await securityUserController.refreshToken(securityUser);
      print("refresh Token: ${securityUser.refreshToken}");
      return updateTitle(id, json);
    }
    return response.statusCode >= 200 && response.statusCode < 300
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
            'Authorization':
                '${securityUser.tokenType} ${securityUser.accessToken}',
          },
          encoding: encoding,
        )
        .timeout(
          const Duration(seconds: 10),
        );
    if (response.statusCode == 401) {
      await securityUserController.refreshToken(securityUser);
      print("refresh Token: ${securityUser.refreshToken}");
      return removeTitle(id);
    }
    return response.statusCode >= 200 && response.statusCode < 300
        ? "Success: Title"
        : "Error: Title ${response.statusCode}";
  }
}

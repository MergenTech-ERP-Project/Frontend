// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/settings/company.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class CompanyRemoteServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<List<Company>?> fetchCompanies() async {
    var response =
        await http.get(Uri.parse(serviceHttp + '/company/list'), headers: {
      'Authorization': '${securityUser.tokenType} ${securityUser.accessToken}',
    });
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      return companyFromJson(jsonString);
    } else if (response.statusCode == 401) {
      securityUserController.refreshToken(securityUser);
      return fetchCompanies();
    } else {
      return null;
    }
  }

  static Future<String> newAddCompany(String json) async {
    var response = await http
        .post(
          Uri.parse(serviceHttp + '/company/new'),
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
      return newAddCompany(json);
    }
    return response.statusCode >= 200 && response.statusCode < 300
        ? "Success: Company"
        : "Error: Company ${response.statusCode}";
  }

  static Future<String> updateCompany(int id, String json) async {
    var response = await http
        .put(
          Uri.parse(serviceHttp + "/company/update/$id"),
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
      return updateCompany(id, json);
    }
    return response.statusCode >= 200 && response.statusCode < 300
        ? "Success: Company"
        : "Error: Company ${response.statusCode}";
  }

  static Future<String> removeCompany(int id) async {
    var response = await http
        .delete(
          Uri.parse(serviceHttp + '/company/remove/$id'),
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
      return removeCompany(id);
    }
    return response.statusCode >= 200 && response.statusCode < 300
        ? "Success: Company"
        : "Error: Company ${response.statusCode}";
  }
}

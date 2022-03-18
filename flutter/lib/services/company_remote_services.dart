import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vtys_kalite/models/settings/company.dart';
import 'package:vtys_kalite/routing/routes.dart';

class CompanyRemoteServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<List<Company>?> fetchCompanies() async {
    var response = await http.get(Uri.parse(serviceHttp + '/company/list'));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      return companyFromJson(jsonString);
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
          },
          body: json,
          encoding: encoding,
        )
        .timeout(
          const Duration(seconds: 10),
        );
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
          },
          body: json,
          encoding: encoding,
        )
        .timeout(
          const Duration(seconds: 10),
        );
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
          },
          encoding: encoding,
        )
        .timeout(
          const Duration(seconds: 10),
        );
    return response.statusCode >= 200 && response.statusCode < 300
        ? "Success: Company"
        : "Error: Company ${response.statusCode}";
  }
}

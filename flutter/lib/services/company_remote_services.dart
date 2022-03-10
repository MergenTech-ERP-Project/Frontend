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

  static Future<int> fetchCompany(String companyName) async {
    var response =
        await http.get(Uri.parse(serviceHttp + '/company/list/$companyName'));
    int companyId = -1;
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      List<Company> companies = companyFromJson(jsonString);
      for (Company company in companies) {
        if (company.companyName == companyName) {
          companyId = companies.indexOf(company);
          break;
        }
      }
    }
    return companyId;
  }

  static Future<String> postCompany(String json) async {
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

  static Future<String> putCompany(int id, String json) async {
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

  static Future<String> deleteCompany(int id) async {
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

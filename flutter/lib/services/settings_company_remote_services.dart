import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vtys_kalite/models/settings/company.dart';
import 'package:vtys_kalite/routing/routes.dart';


class CompanyRemoteServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<List<Company>?> fetchCompanies() async {
    var response =
        await http.get(Uri.parse(serviceHttp + '/company/companies'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return companyFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<int> fetchCompany(String _company_name) async {
    var response = await http
        .get(Uri.parse(serviceHttp + '/company/companies/$_company_name'));
    int companyId = -1;
    if (response.statusCode == 200) {
      var jsonString = response.body;
      List<Company> companies = companyFromJson(jsonString);
      for (Company company in companies) {
        if (company.companyName == _company_name) {
          companyId = companies.indexOf(company);
          print(companyId);
          break;
        }
      }
    }
    return companyId;
  }

  static Future<String> postCompany(String json) async {
    print("Json: $json");
    var response = await http
        .post(
          Uri.parse(serviceHttp + '/company/post'),
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
        ? "Success: Company"
        : "Error: Company ${response.statusCode}";
  }

  static Future<String> putCompany(int id, String json) async {
    print("Json: $json");
    var response = await http
        .put(
          Uri.parse(serviceHttp + "/company/put/$id"),
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
        ? "Success: Company"
        : "Error: Company ${response.statusCode}";
  }

  static Future<String> deleteCompany(int id) async {
    var response = await http
        .delete(
          Uri.parse(serviceHttp + '/company/delete/$id'),
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
        ? "Success: Company"
        : "Error: Company ${response.statusCode}";
  }
}

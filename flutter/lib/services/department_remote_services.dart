import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vtys_kalite/models/settings/department.dart';
import 'package:vtys_kalite/routing/routes.dart';

class DepartmentRemoteServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<List<Department>?> fetchDepartments() async {
    var response = await http.get(Uri.parse(serviceHttp + '/department/list'));
    if (response.statusCode == 200) {
      var jsonString = utf8.decode(response.bodyBytes);
      return departmentFromJson(jsonString);
    } else {
      return null;
    }
  }

  /* static Future<int> fetchDepartment(companyId, branchId) async {
    var response = await http
        .get(Uri.parse(serviceHttp + '/department/$companyId/$branchId'));
    int departmentId = -1;
    if (response.statusCode == 200) {
      var jsonString = utf8.decode(response.bodyBytes);
      List<Department> companies = departmentFromJson(jsonString);
      for (Department department in companies) {
        if (department.departmentName == departmentName) {
          departmentId = companies.indexOf(department);
          break;
        }
      }
    }
    return departmentId;
  } */

  static Future<String> newDepartment(String json) async {
    var response = await http
        .post(
          Uri.parse(serviceHttp + '/department/new'),
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
        ? "Success: Department"
        : "Error: Department ${response.statusCode}";
  }

  static Future<String> updateDepartment(int id, String json) async {
    var response = await http
        .put(
          Uri.parse(serviceHttp + "/department/update/$id"),
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
        ? "Success: Department"
        : "Error: Department ${response.statusCode}";
  }

  static Future<String> removeDepartment(int id) async {
    var response = await http
        .delete(
          Uri.parse(serviceHttp + '/department/remove/$id'),
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
        ? "Success: Department"
        : "Error: Department ${response.statusCode}";
  }
}
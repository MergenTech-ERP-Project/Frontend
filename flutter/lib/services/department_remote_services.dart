import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vtys_kalite/models/settings/department.dart';
import 'package:vtys_kalite/routing/routes.dart';

class DepartmentRemoteServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<List<Department>?> fetchDepartments() async {
    var response = await http.get(Uri.parse(serviceHttp + '/department/list'));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      return departmentFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<List<Department>?> fetchDepartmentsByBranchId(branchId) async {
    var response = await http
        .get(Uri.parse(serviceHttp + '/department/find/branch:$branchId'));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      List<Department> departments = departmentFromJson(jsonString);
      return departments;
    }
    return null;
  }

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
    return response.statusCode >= 200 && response.statusCode < 300
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
    return response.statusCode >= 200 && response.statusCode < 300
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
    return response.statusCode >= 200 && response.statusCode < 300
        ? "Success: Department"
        : "Error: Department ${response.statusCode}";
  }
}

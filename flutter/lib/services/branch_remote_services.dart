// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vtys_kalite/models/settings/branch.dart';
import 'package:vtys_kalite/routing/routes.dart';

class BranchRemoteServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<List<Branch>?> fetchBranches() async {
    var response = await http.get(Uri.parse(serviceHttp + '/branch/list'));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      return branchFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<List<Branch>?> fetchBranchesByCompanyId(int companyId) async {
    var response = await http
        .get(Uri.parse(serviceHttp + '/branch/find/company:$companyId'));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      return branchFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<int> fetchBranch(int companyId, String branchName) async {
    var response = await http
        .get(Uri.parse(serviceHttp + '/branch/$companyId/$branchName'));
    int branchId = -1;
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      List<Branch> branches = branchFromJson(jsonString);
      for (Branch branch in branches) {
        if (branch.branchName == branchName) {
          branchId = branches.indexOf(branch);
          print(branchId);
          break;
        }
      }
    }
    return branchId;
  }

  static Future<String> newAddBranch(String json) async {
    print("Json: $json");
    var response = await http
        .post(
          Uri.parse(serviceHttp + '/branch/new'),
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
        ? "Success: Branch"
        : "Error: Branch ${response.statusCode}";
  }

  static Future<String> updateBranch(int id, String json) async {
    print("Json: $json");
    var response = await http
        .put(
          Uri.parse(serviceHttp + "/branch/update/$id"),
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
        ? "Success: Branch"
        : "Error: Branch ${response.statusCode}";
  }

  static Future<String> removeBranch(int id) async {
    var response = await http
        .delete(
          Uri.parse(serviceHttp + '/branch/remove/$id'),
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
        ? "Success: Branch"
        : "Error: Branch ${response.statusCode}";
  }
}

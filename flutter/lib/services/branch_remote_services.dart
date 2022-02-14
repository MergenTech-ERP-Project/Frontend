import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vtys_kalite/models/settings/branch.dart';
import 'package:vtys_kalite/routing/routes.dart';


class BranchRemoteServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<List<Branch>?> fetchBranches() async {
    var response = await http.get(Uri.parse(
       serviceHttp + '/branch/branches'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return branchFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<int> fetchBranch(String _branch_name) async {
    var response = await http.get(Uri.parse(
        serviceHttp + '/branch/branches/$_branch_name'));
    int branchId = -1;
    if (response.statusCode == 200) {
      var jsonString = response.body;
      List<Branch> branches = branchFromJson(jsonString);
      for (Branch branch in branches) {
        if (branch.branch_name == _branch_name) {
          branchId = branches.indexOf(branch);
          print(branchId);
          break;
        }
      }
    }
    return branchId;
  }

  static Future<String> postBranch(String json) async {
    print("Json: $json");
    var response = await http
        .post(
      Uri.parse(
          serviceHttp + '/branch/post'),
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
        ? "Success: Branch"
        : "Error: Branch ${response.statusCode}";
  }

  static Future<String> putBranch(int id, String json) async {
    print("Json: $json");
    var response = await http
        .put(
      Uri.parse(
          serviceHttp + "/branch/put/$id"),
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
        ? "Success: Branch"
        : "Error: Branch ${response.statusCode}";
  }

  static Future<String> deleteBranch(int id) async {
    var response = await http
        .delete(
      Uri.parse(
        serviceHttp + '/branch/delete/$id'),
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
        ? "Success: Branch"
        : "Error: Branch ${response.statusCode}";
  }
}

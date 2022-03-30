// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/settings/branch.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class BranchRemoteServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<List<Branch>?> fetchBranches() async {
    var response =
        await http.get(Uri.parse(serviceHttp + '/branch/list'), headers: {
      'Authorization': '${securityUser.tokenType} ${securityUser.accessToken}',
    });
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      return branchFromJson(jsonString);
    } else if (response.statusCode == 401) {
      securityUserController.refreshToken(securityUser);
      return fetchBranches();
    } else {
      return null;
    }
  }

  static Future<List<Branch>?> fetchBranchesByCompanyId(int companyId) async {
    var response = await http.get(
        Uri.parse(serviceHttp + '/branch/find/company:$companyId'),
        headers: {
          'Authorization':
              '${securityUser.tokenType} ${securityUser.accessToken}',
        });
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      return branchFromJson(jsonString);
    } else if (response.statusCode == 401) {
      securityUserController.refreshToken(securityUser);
      return fetchBranchesByCompanyId(companyId);
    } else {
      return null;
    }
  }

  static Future<String> newAddBranch(String json) async {
    print("Json: $json");
    var response = await http
        .post(
          Uri.parse(serviceHttp + '/branch/new'),
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
      return newAddBranch(json);
    }
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
      return updateBranch(id, json);
    }
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
      return removeBranch(id);
    }
    return response.statusCode >= 200 && response.statusCode < 300
        ? "Success: Branch"
        : "Error: Branch ${response.statusCode}";
  }
}

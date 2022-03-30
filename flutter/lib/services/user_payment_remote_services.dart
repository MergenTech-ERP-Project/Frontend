// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/User%20Detail/user_payment.dart';
import 'package:vtys_kalite/routing/routes.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class UserDetailPaymentServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<UserDetailPayment?> fetchUserDetailPaymentById(
      userDetailId) async {

    var response = await http
        .get(Uri.parse(serviceHttp + '/payments/list/$userDetailId'), headers: {
      'Authorization': '${securityUser.tokenType} ${securityUser.accessToken}',
    });

    UserDetailPayment? userDetailPayment;
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      if (jsonString == "null") {
        return null;
      }
      jsonString = "[" + jsonString + "]";
      userDetailPayment = parseUserPayment(jsonString);
    } else if (response.statusCode == 401) {
      securityUserController.refreshToken(securityUser);
      return fetchUserDetailPaymentById(userDetailId);
    } else {
      return userDetailPayment;
    }
    return userDetailPayment;
  }

  static Future<int> addNewUserDetailPayment(String json) async {
    print(json);
    var response = await http
        .post(
          Uri.parse(serviceHttp + '/payments/post'),
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
      return addNewUserDetailPayment(json);
    }
    return response.statusCode;
  }

  static Future<String> updateUserDetailPayment(int id, String json) async {
    var response = await http
        .put(Uri.parse(serviceHttp + '/payments/put/$id'),
            headers: <String, String>{
              'Content-type': 'application/json',
              'Accept': 'application/json',
              'Authorization':
                  '${securityUser.tokenType} ${securityUser.accessToken}',
            },
            body: json,
            encoding: encoding)
        .timeout(
          const Duration(seconds: 10),
        );
    if (response.statusCode == 401) {
      await securityUserController.refreshToken(securityUser);
      print("refresh Token: ${securityUser.refreshToken}");
      return updateUserDetailPayment(id, json);
    }
    return (response.statusCode >= 200 && response.statusCode < 300)
        ? "Success: User Detail"
        : "Error: User Detail${response.statusCode}";
  }

  static Future<String> removeUserDetailPayment(int id) async {
    var response = await http
        .delete(Uri.parse(serviceHttp + '/payments/delete/$id'),
            headers: <String, String>{
              'Content-type': 'application/json',
              'Accept': 'application/json',
              'Authorization':
                  '${securityUser.tokenType} ${securityUser.accessToken}',
            },
            encoding: encoding)
        .timeout(
          const Duration(seconds: 10),
        );
    if (response.statusCode == 401) {
      await securityUserController.refreshToken(securityUser);
      print("refresh Token: ${securityUser.refreshToken}");
      return removeUserDetailPayment(id);
    }
    return (response.statusCode >= 200 && response.statusCode < 300)
        ? "Success: User Detail"
        : "Error: User Detail${response.statusCode}";
  }
}

// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vtys_kalite/models/security_user.dart';
import 'package:vtys_kalite/routing/routes.dart';

class SecurityUserRemoteServices {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<int> refreshTokenSecurity(String json) async {
    print(json);
    var response = await http
        .post(Uri.parse(serviceHttp + '/api/auth/refreshToken'),
            headers: <String, String>{
              'Content-type': 'application/json',
              'Accept': 'application/json',
            },
            body: json,
            encoding: encoding)
        .timeout(
          const Duration(seconds: 10),
        );
    return response.statusCode;
  }

  static Future<SecurityUser?> signInSecurity(String json) async {
    print(json);
    var response = await http
        .post(Uri.parse(serviceHttp + '/api/auth/signin'),
            headers: <String, String>{
              'Content-type': 'application/json',
              'Accept': 'application/json',
            },
            body: json,
            encoding: encoding)
        .timeout(
          const Duration(seconds: 10),
        );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var jsonString = utf8.decode(response.bodyBytes);
      if (jsonString == "null") {
        return null;
      }
      jsonString = "[" + jsonString + "]";
      return parseSecurityUser(jsonString);
    }
    return null;
  }

  static Future<int> signUpSecurity(String json) async {
    print(json);
    var response = await http
        .post(Uri.parse(serviceHttp + '/api/auth/signup'),
            headers: <String, String>{
              'Content-type': 'application/json',
              'Accept': 'application/json',
            },
            body: json,
            encoding: encoding)
        .timeout(
          const Duration(seconds: 10),
        );
    return response.statusCode;
  }
}


/**
 * refresh token
 * access token
 * 
 * 
 * sign in
 * sign up
 * log out
 * refresh token
 */
import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:vtys_kalite/enums/roles.dart';

List<SecurityUser> parseSecurityUsers(String str) => List<SecurityUser>.from(
    json.decode(str).map((x) => SecurityUser.fromJson(x)));

SecurityUser? parseSecurityUser(String str) {
  List<SecurityUser> securityUsers = parseSecurityUsers(str);
  return securityUsers.isNotEmpty ? securityUsers[0] : null;
}

String fetchSecurityUsers(List<SecurityUser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SecurityUser {
  String refreshToken;
  int id;
  String username;
  String email;
  RolesEnum roles;
  String tokenType;
  String accessToken;

  SecurityUser({
    this.refreshToken = "",
    this.id = -1,
    this.username = "",
    this.email = "",
    this.roles = RolesEnum.user,
    this.tokenType = "Bearer",
    this.accessToken = "",
  });

  factory SecurityUser.fromJson(Map<String, dynamic> json) {
    return SecurityUser(
        refreshToken: json['refreshToken'] ?? "",
        id: json['id'] ?? -1,
        username: json['username'] ?? "",
        email: json['email'] ?? "",
        roles: EnumToString.fromString(
              RolesEnum.values,
              json['roles'].toString(),
            ) ??
            RolesEnum.user,
        tokenType: json['tokenType'] ?? "Bearer",
        accessToken: json['accessToken']);
  }

  Map<String, dynamic> toJson() => {
        "refreshToken": refreshToken,
        "id": id,
        "username": username,
        "email": email,
        "roles": EnumToString.convertToString(roles),
        "tokenType": "tokenType",
        "accessToken": "accessToken",
      };
}

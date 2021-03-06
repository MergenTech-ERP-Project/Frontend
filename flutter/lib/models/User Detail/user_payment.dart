import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:vtys_kalite/enums/payment_scheme.dart';
import 'package:vtys_kalite/enums/salary_type.dart';

List<UserDetailPayment> parseUsersPayment(String str) =>
    List<UserDetailPayment>.from(
        json.decode(str).map((x) => UserDetailPayment.fromJson(x)));

UserDetailPayment parseUserPayment(String str) => parseUsersPayment(str)[0];

String fetchUsersPayment(List<UserDetailPayment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// The part written with // places written with json.

class UserDetailPayment {
  int id;
  int userDetailId; //user_detail_id
  String salary; //salary
  String currency; //currency
  SalaryTypeEnum salaryType; //salary_type
  PaymentSchemeEnum paymentScheme; //payment_scheme
  String foodSupportFee; //food_support_fee
  String commuteSupportFee; //commute_support_fee

  UserDetailPayment({
    this.id = -1,
    required this.userDetailId,
    this.salary = "",
    this.currency = "",
    this.salaryType = SalaryTypeEnum.none,
    this.paymentScheme = PaymentSchemeEnum.none,
    this.commuteSupportFee = "",
    this.foodSupportFee = "",
  });

  factory UserDetailPayment.fromJson(Map<String, dynamic> json) {
    return UserDetailPayment(
      id: json['id'] ?? -1,
      userDetailId: json["user_detail_id"] ?? -1,
      salary: json['salary'] ?? "",
      currency: json['currency'] ?? "",
      salaryType: EnumToString.fromString(
              SalaryTypeEnum.values, json['salary_type'].toString()) ??
          SalaryTypeEnum.values.first,
      paymentScheme: EnumToString.fromString(
              PaymentSchemeEnum.values, json['payment_scheme'].toString()) ??
          PaymentSchemeEnum.values.first,
      commuteSupportFee: json['commute_support_fee'],
      foodSupportFee: json['food_support_fee'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_detail_id": userDetailId,
        "salary": salary,
        "currency": currency,
        "salary_type": EnumToString.convertToString(salaryType),
        "payment_scheme": EnumToString.convertToString(paymentScheme),
        "commute_support_fee": commuteSupportFee,
        "food_support_fee": foodSupportFee,
      };
}

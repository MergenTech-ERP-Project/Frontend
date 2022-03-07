import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:vtys_kalite/enums/payment_scheme.dart';
import 'package:vtys_kalite/enums/salary_type.dart';

List<UserDetailPayment> parseUsers(String str) => List<UserDetailPayment>.from(
    json.decode(str).map((x) => UserDetailPayment.fromJson(x)));

UserDetailPayment parseUserDetailPayment(String str) => parseUsers(str)[0];

String fetchUsers(List<UserDetailPayment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// The part written with // places written with json.

class UserDetailPayment {
  final String? tcno; //tcno
  final String? salary; //salary
  final String? currency; //currency
  SalaryTypeEnum? salaryType; //salary_type
  PaymentSchemeEnum? paymentScheme; //payment_scheme
  final String? commuteSupportFee; //commute_support_fee
  final String? foodSupportFee; //food_support_fee

  UserDetailPayment({
    this.tcno,
    this.salary,
    this.currency,
    this.salaryType,
    this.paymentScheme,
    this.commuteSupportFee,
    this.foodSupportFee,
  });

  String getSalaryType() => EnumToString.convertToString(salaryType);
  String getPaymentScheme() => EnumToString.convertToString(paymentScheme);

  factory UserDetailPayment.fromJson(Map<String, dynamic> json) {
    return UserDetailPayment(
      tcno: json['tcno'],
      salary: json['salary'],
      currency: json['currency'],
      salaryType:
          EnumToString.fromString(SalaryTypeEnum.values, json['salary_type'])!,
      paymentScheme: EnumToString.fromString(
          PaymentSchemeEnum.values, json['payment_scheme'])!,
      commuteSupportFee: json['commute_support_fee'],
      foodSupportFee: json['food_support_fee'],
    );
  }

  Map<String, dynamic> toJson() => {
        "tcno": tcno,
        "salary": salary,
        "currency": currency,
        "salary_type": getSalaryType(),
        "payment_scheme": getPaymentScheme(),
        "commute_support_fee": commuteSupportFee,
        "food_support_fee": foodSupportFee,
      };
}
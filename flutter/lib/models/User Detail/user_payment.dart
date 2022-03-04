import 'dart:convert';

List<UserDetailPayment> parseUsers(String str) => List<UserDetailPayment>.from(
    json.decode(str).map((x) => UserDetailPayment.fromJson(x)));

UserDetailPayment parseUserDetailPayment(String str) => parseUsers(str)[0];

String fetchUsers(List<UserDetailPayment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// The part written with // places written with json.

class UserDetailPayment {
  final int? id; //id
  final String? salary; //salary
  final String? currency; //currency
  final String? salaryType; //salary_type
  final String? paymentScheme; //payment_scheme
  final String? commuteSupportFee; //commute_support_fee
  final String? foodSupportFee; //food_support_fee

  UserDetailPayment({
    this.id,
    this.salary,
    this.currency,
    this.salaryType,
    this.paymentScheme,
    this.commuteSupportFee,
    this.foodSupportFee,
  });

  factory UserDetailPayment.fromJson(Map<String, dynamic> json) {
    return UserDetailPayment(
      id: json['id'],
      salary: json['salary'],
      currency: json['currency'],
      salaryType: json['salary_type'],
      paymentScheme: json['payment_scheme'],
      commuteSupportFee: json['commute_support_fee'],
      foodSupportFee: json['food_support_fee'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "salary": salary,
        "currency": currency,
        "salary_type": salaryType,
        "payment_scheme": paymentScheme,
        "commute_support_fee": commuteSupportFee,
        "food_support_fee": foodSupportFee,
      };
}

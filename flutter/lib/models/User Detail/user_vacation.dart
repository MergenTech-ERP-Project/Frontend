import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:vtys_kalite/enums/vacation_request_status.dart';

List<UserDetailVacation> parseUsersDetailVacation(String str) =>
    List<UserDetailVacation>.from(
        json.decode(str).map((x) => UserDetailVacation.fromJson(x)));

UserDetailVacation parseUserDetailVacation(String str) =>
    parseUsersDetailVacation(str)[0];

String fetchUsersDetailVacation(List<UserDetailVacation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDetailVacation {
  final int id; //id
  final int userDetailId; //user_detail_id
  int permissonSaveId; //permisson_save_id
  int vacationType; //vacation_type
  VacationRequestStatusEnum vacationRequestStatus; //vacation_request_status
  int workingDayNumber; //working_day_number
  String sicilNo; //sicil_no
  String workStartDate; //work_start_date
  String recognizant; //recognizant;

  UserDetailVacation({
    this.id = -1,
    required this.userDetailId,
    this.permissonSaveId = -1,
    this.workingDayNumber = 0,
    this.vacationType = 0,
    this.sicilNo = "",
    this.workStartDate = "",
    this.recognizant = "",
    required this.vacationRequestStatus,
  });

  factory UserDetailVacation.fromJson(Map<String, dynamic> json) {
    return UserDetailVacation(
      id: json['id'] ?? -1,
      userDetailId: json["user_detail_id"],
      permissonSaveId: json["permisson_save_id"] ?? -1,
      workingDayNumber: json["working_day_number"] ?? "",
      sicilNo: json["sicil_no"] ?? "",
      workStartDate: json["work_start_date"] ?? "",
      vacationType: json["vacation_type"] ?? 0,
      recognizant: json["recognizant"] ?? "",
      vacationRequestStatus: EnumToString.fromString(
            VacationRequestStatusEnum.values,
            json['vacation_request_status'].toString(),
          ) ??
          VacationRequestStatusEnum.values.first,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_detail_id": userDetailId,
        "permisson_save_id": permissonSaveId,
        "working_day_number": workingDayNumber,
        "sicil_no": sicilNo,
        "work_start_date": workStartDate,
        "vacation_type": vacationType.toString(),
        "recognizant": recognizant,
        "vacation_request_status":
            EnumToString.convertToString(vacationRequestStatus),
      };
}

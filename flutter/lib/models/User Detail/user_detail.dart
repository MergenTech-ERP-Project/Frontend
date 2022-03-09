import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:vtys_kalite/enums/bank_account_type.dart';
import 'package:vtys_kalite/enums/bank_names.dart';
import 'package:vtys_kalite/enums/blood_type.dart';
import 'package:vtys_kalite/enums/contract_type.dart';
import 'package:vtys_kalite/enums/disabled_degree.dart';
import 'package:vtys_kalite/enums/educational_status.dart';
import 'package:vtys_kalite/enums/gender.dart';
import 'package:vtys_kalite/enums/highest_education_level_completed.dart';
import 'package:vtys_kalite/enums/marial_status.dart';
import 'package:vtys_kalite/enums/military_status.dart';
import 'package:vtys_kalite/enums/employment_type.dart';

List<UserDetail> parseUsers(String str) =>
    List<UserDetail>.from(json.decode(str).map((x) => UserDetail.fromJson(x)));

UserDetail parseUser(String str) => parseUsers(str)[0];

String fetchUsers(List<UserDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// The part written with // places written with json.

class UserDetail {
  final String? tcno; //tcno
  String? dateofbirth; //dateofbirth
  final String? workPhone; //work_phone
  MaritalStatusEnum? maritalStatus; //maritalstatus
  final String? numberofkids; //numberofkids
  DisabledDegreeEnum? disabledDegree; //degree_of_disability
  GenderEnum? gender; //gender
  EducationalStatusEnum? educationalStatus; //education_status
  HighestEducationLevelCompletedEnum?
      highestEducationLevelCompleted; //highest_education_level_completed
  final String? lastCompletedEducationStatus; //last_completed_education_status
  EmploymentTypeEnum? employmentType; //employment_type
  MilitaryStatusEnum? militaryStatus; //military_service_status
  String? startDateWork; //date_of_start
  ContractTypeEnum? contractType; //contract_type
  String? contractEndDate; //contract_end_date
  final String? workEmail; //work_email
  final String? address; //adress
  final String? addressCountry; //country
  final String? addressDistrict; //address_district
  final String? addressCity; //city
  final String? addressZipCode; //zip_code
  final String? homePhone; //home_telephone
  BankNamesEnum? bankNames; //bank_name
  BankAccountTypeEnum? bankAccountType; //bank_account_type
  final String? bankAccountNumber; //bank_account_number
  final String? iban; //iban
  final String? emergencyContactPerson; //emergency_contact
  final String? relationshipEmergencyContact; //relationship_emergency_contact
  final String? emergencyContactCellPhone; //emergency_contact_phone
  String? quitWorkDate; //quit_date
  final String? reasonTypeForQuit; //quit_reason_type
  final String? reasonExplainForQuit; //reason_explain_for_quit
  BloodTypeEnum? bloodType; //blood_type

  UserDetail({
    this.tcno,
    this.dateofbirth,
    this.workPhone,
    this.maritalStatus,
    this.numberofkids,
    this.disabledDegree,
    this.gender,
    this.educationalStatus,
    this.highestEducationLevelCompleted,
    this.lastCompletedEducationStatus,
    this.employmentType,
    this.militaryStatus,
    this.startDateWork,
    this.contractType,
    this.contractEndDate,
    this.workEmail,
    this.address,
    this.addressCountry,
    this.addressDistrict,
    this.addressCity,
    this.addressZipCode,
    this.homePhone,
    this.bankNames,
    this.bankAccountType,
    this.bankAccountNumber,
    this.iban,
    this.emergencyContactPerson,
    this.relationshipEmergencyContact,
    this.emergencyContactCellPhone,
    this.quitWorkDate,
    this.reasonTypeForQuit,
    this.reasonExplainForQuit,
    this.bloodType,
  });

  String getMaritalStatus() => EnumToString.convertToString(maritalStatus);
  String getDisabledDegree() => EnumToString.convertToString(disabledDegree);
  String getEducationalStatus() =>
      EnumToString.convertToString(educationalStatus);
  String getHighestEducationLevelCompleted() =>
      EnumToString.convertToString(highestEducationLevelCompleted);
  String getBankNames() => EnumToString.convertToString(bankNames);
  String getBankAccountType() => EnumToString.convertToString(bankAccountType);
  String getBloodtype() => EnumToString.convertToString(bloodType);

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      tcno: json['tcno'],
      dateofbirth: json['dateofbirth'],
      workPhone: json['work_phone'],
      maritalStatus: EnumToString.fromString(
          MaritalStatusEnum.values, json['maritalstatus'])!,
      numberofkids: json['numberofkids'],
      disabledDegree: EnumToString.fromString(
          DisabledDegreeEnum.values, json['degree_of_disability'])!,
      gender: EnumToString.fromString(GenderEnum.values, json['gender'])!,
      educationalStatus: EnumToString.fromString(
          EducationalStatusEnum.values, json['education_status'])!,
      highestEducationLevelCompleted: json['highest_education_level_completed'],
      lastCompletedEducationStatus: json['last_completed_education_status'],
      employmentType: EnumToString.fromString(
          EmploymentTypeEnum.values, json['employment_type'])!,
      militaryStatus: EnumToString.fromString(
          MilitaryStatusEnum.values, json['military_service_status'])!,
      startDateWork: json['date_of_start'],
      contractType: EnumToString.fromString(
          ContractTypeEnum.values, json['contract_type'])!,
      contractEndDate: json['contract_end_date'],
      workEmail: json['work_email'],
      address: json['adress'],
      addressCountry: json['country'],
      addressDistrict: json['address_district'],
      addressCity: json['city'],
      addressZipCode: json['zip_code'],
      homePhone: json['home_telephone'],
      bankNames:
          EnumToString.fromString(BankNamesEnum.values, json['bankNames'])!,
      bankAccountType: EnumToString.fromString(
          BankAccountTypeEnum.values, json['bank_account_type'])!,
      bankAccountNumber: json['bank_account_number'],
      iban: json['iban'],
      emergencyContactPerson: json['emergency_contact'],
      relationshipEmergencyContact: json['relationship_emergency_contact'],
      emergencyContactCellPhone: json['emergency_contact_phone'],
      quitWorkDate: json['quit_date'],
      reasonTypeForQuit: json['quit_reason_type'],
      reasonExplainForQuit: json['reason_explain_for_quit'],
      bloodType:
          EnumToString.fromString(BloodTypeEnum.values, json['blood_type'])!,
    );
  }

  Map<String, dynamic> toJson() => {
        "tcno": tcno,
        "dateofbirth": dateofbirth,
        "work_phone": workPhone,
        "maritalstatus": getMaritalStatus(),
        "numberofkids": numberofkids,
        "degree_of_disability": getDisabledDegree(),
        "gender": gender,
        "education_status": getEducationalStatus(),
        "highest_education_level_completed":
            getHighestEducationLevelCompleted(),
        "last_completed_education_status": lastCompletedEducationStatus,
        "employment_type": employmentType,
        "military_service_status": militaryStatus,
        "date_of_start": startDateWork,
        "contract_type": contractType,
        "contract_end_date": contractEndDate,
        "work_email": workEmail,
        "adress": address,
        "country": addressCountry,
        "address_district": addressDistrict,
        "city": addressCity,
        "zip_code": addressZipCode,
        "home_telephone": homePhone,
        "bank_name": getBankNames(),
        "bank_account_type": getBloodtype(),
        "bank_account_number": bankAccountNumber,
        "iban": iban,
        "emergency_contact": emergencyContactPerson,
        "relationship_emergency_contact": relationshipEmergencyContact,
        "emergency_contact_phone": emergencyContactCellPhone,
        "quit_date": quitWorkDate,
        "quit_reason_type": reasonTypeForQuit,
        "reason_explain_for_quit": reasonExplainForQuit,
        "blood_type": getBloodtype(),
      };
}

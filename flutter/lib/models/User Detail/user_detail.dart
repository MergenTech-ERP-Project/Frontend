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

List<UserDetail>? parseUsersDetail(String str) =>
    List<UserDetail>.from(json.decode(str).map((x) => UserDetail.fromJson(x)));

UserDetail? parseUserDetail(String str) => parseUsersDetail(str)?[0];

String fetchUsersDetail(List<UserDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// The part written with // places written with json.

class UserDetail {
  int id;
  int userId; //user_id
  int numberofkids; //numberofkids
  String tcno; //tc_no
  String workPhone; //work_phone
  String lastCompletedEducationStatus; //last_completed_education_status
  String dateofbirth; //dateofbirth
  String startDateWork; //date_of_start
  String contractEndDate; //contract_end_date
  String quitWorkDate; //quit_date
  String workEmail; //work_email
  String address; //address
  String addressCountry; //country
  String addressDistrict; //address_district
  String addressCity; //city
  String addressZipCode; //zip_code
  String homePhone; //home_telephone
  String bankAccountNumber; //bank_account_number
  String iban; //iban
  String emergencyContactPerson; //emergency_contact
  String relationshipEmergencyContact; //relationship_emergency_contact
  String emergencyContactCellPhone; //emergency_contact_phone
  String reasonTypeForQuit; //quit_reason_type
  String quitExplanation; //quit_explanation
  String nationality; //nationality
  GenderEnum gender; //gender
  BloodTypeEnum bloodType; //blood_type
  BankNamesEnum bankNames; //bank_name
  ContractTypeEnum contractType; //contract_type
  MaritalStatusEnum maritalStatus; //maritalstatus
  DisabledDegreeEnum disabledDegree; //degree_of_disability
  MilitaryStatusEnum militaryStatus; //military_service_status
  EmploymentTypeEnum employmentType; //employment_type
  BankAccountTypeEnum bankAccountType; //bank_account_type
  EducationalStatusEnum educationalStatus; //education_status
  HighestEducationLevelCompletedEnum
      highestEducationLevelCompleted; //highest_education_level_completed

  UserDetail({
    this.id = -1,
    required this.userId,
    required this.tcno,
    this.numberofkids = 0,
    this.workPhone = "",
    this.lastCompletedEducationStatus = "",
    this.dateofbirth = "",
    this.startDateWork = "",
    this.contractEndDate = "",
    this.workEmail = "",
    this.address = "",
    this.addressCountry = "",
    this.addressDistrict = "",
    this.addressCity = "",
    this.addressZipCode = "",
    this.homePhone = "",
    this.bankAccountNumber = "",
    this.iban = "",
    this.emergencyContactPerson = "",
    this.relationshipEmergencyContact = "",
    this.emergencyContactCellPhone = "",
    this.quitWorkDate = "",
    this.reasonTypeForQuit = "",
    this.quitExplanation = "none",
    this.nationality = "",
    this.maritalStatus = MaritalStatusEnum.married,

    ///TODO : NONE
    this.disabledDegree = DisabledDegreeEnum.firstDegreeDisabled,

    ///TODO : NONE
    this.gender = GenderEnum.male,

    ///TODO : NONE
    this.educationalStatus = EducationalStatusEnum.graduate,

    ///TODO : NONE
    this.highestEducationLevelCompleted =
        HighestEducationLevelCompletedEnum.bachelorsDegree,

    ///TODO : NONE
    this.employmentType = EmploymentTypeEnum.freelancer,

    ///TODO : NONE
    this.militaryStatus = MilitaryStatusEnum.exempt,

    ///TODO : NONE
    this.contractType = ContractTypeEnum.indenfinite,

    ///TODO : NONE
    this.bankNames = BankNamesEnum.akBank,

    ///TODO : NONE
    this.bankAccountType = BankAccountTypeEnum.drawingAccount,

    ///TODO : NONE
    this.bloodType = BloodTypeEnum.aPlus,

    ///TODO : NONE
  });

  String? getGender() => EnumToString.convertToString(gender);
  String? getBloodtype() => EnumToString.convertToString(bloodType);
  String? getBankNames() => EnumToString.convertToString(bankNames);
  String? getContractType() => EnumToString.convertToString(contractType);
  String? getMaritalStatus() => EnumToString.convertToString(maritalStatus);
  String? getDisabledDegree() => EnumToString.convertToString(disabledDegree);
  String? getMilitaryStatus() => EnumToString.convertToString(militaryStatus);
  String? getEmploymentType() => EnumToString.convertToString(employmentType);
  String? getBankAccountType() => EnumToString.convertToString(bankAccountType);
  String? getEducationalStatus() =>
      EnumToString.convertToString(educationalStatus);
  String? getHighestEducationLevelCompleted() =>
      EnumToString.convertToString(highestEducationLevelCompleted);

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      id: json['id'] ?? -1,
      userId: json['user_id'],
      numberofkids: json['numberofkids'] ?? 0,
      tcno: json['tc_no'] ?? "",
      workPhone: json['work_phone'] ?? "",
      lastCompletedEducationStatus:
          json['last_completed_education_status'] ?? "",
      dateofbirth: json['dateofbirth'] ?? "",
      startDateWork: json['date_of_start'] ?? "",
      contractEndDate: json['contract_end_date'] ?? "",
      quitWorkDate: json['quit_date'] ?? "",
      workEmail: json['work_email'] ?? "",
      address: json['address'] ?? "",
      addressCountry: json['country'] ?? "",
      addressDistrict: json['address_district'] ?? "",
      addressCity: json['city'] ?? "",
      addressZipCode: json['zip_code'] ?? "",
      homePhone: json['home_telephone'] ?? "",
      bankAccountNumber: json['bank_account_number'] ?? "",
      iban: json['iban'] ?? "",
      emergencyContactPerson: json['emergency_contact'] ?? "",
      relationshipEmergencyContact:
          json['relationship_emergency_contact'] ?? "",
      emergencyContactCellPhone: json['emergency_contact_phone'] ?? "",
      reasonTypeForQuit: json['quit_reason_type'] ?? "",
      quitExplanation: json['quit_explanation'] ?? "",
      nationality: json["nationality"] ?? "",
      gender: EnumToString.fromString(
            GenderEnum.values,
            json['gender'].toString(),
          ) ??
          GenderEnum.values.first,
      bloodType: EnumToString.fromString(
            BloodTypeEnum.values,
            json['blood_type'].toString(),
          ) ??
          BloodTypeEnum.values.first,
      bankNames: EnumToString.fromString(
            BankNamesEnum.values,
            json['bank_name'].toString(),
          ) ??
          BankNamesEnum.values.first,
      contractType: EnumToString.fromString(
            ContractTypeEnum.values,
            json['contract_type'].toString(),
          ) ??
          ContractTypeEnum.values.first,
      maritalStatus: EnumToString.fromString(
            MaritalStatusEnum.values,
            json['maritalstatus'].toString(),
          ) ??
          MaritalStatusEnum.values.first,
      disabledDegree: EnumToString.fromString(
            DisabledDegreeEnum.values,
            json['degree_of_disability'].toString(),
          ) ??
          DisabledDegreeEnum.values.first,
      militaryStatus: EnumToString.fromString(
            MilitaryStatusEnum.values,
            json['military_service_status'].toString(),
          ) ??
          MilitaryStatusEnum.values.first,
      employmentType: EnumToString.fromString(
            EmploymentTypeEnum.values,
            json['employment_type'].toString(),
          ) ??
          EmploymentTypeEnum.values.first,
      bankAccountType: EnumToString.fromString(
            BankAccountTypeEnum.values,
            json['bank_account_type'].toString(),
          ) ??
          BankAccountTypeEnum.values.first,
      educationalStatus: EnumToString.fromString(
            EducationalStatusEnum.values,
            json['education_status'].toString(),
          ) ??
          EducationalStatusEnum.values.first,
      highestEducationLevelCompleted: EnumToString.fromString(
            HighestEducationLevelCompletedEnum.values,
            json['highest_education_level_completed'].toString(),
          ) ??
          HighestEducationLevelCompletedEnum.values.first,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "numberofkids": numberofkids.toString(),
        "tc_no": tcno,
        "work_phone": workPhone,
        "last_completed_education_status": lastCompletedEducationStatus,
        "dateofbirth": dateofbirth,
        "date_of_start": startDateWork,
        "contract_end_date": contractEndDate,
        "quit_date": quitWorkDate,
        "work_email": workEmail,
        "address": address,
        "country": addressCountry,
        "address_district": addressDistrict,
        "city": addressCity,
        "zip_code": addressZipCode,
        "home_telephone": homePhone,
        "bank_account_number": bankAccountNumber,
        "iban": iban,
        "emergency_contact": emergencyContactPerson,
        "relationship_emergency_contact": relationshipEmergencyContact,
        "emergency_contact_phone": emergencyContactCellPhone,
        "quit_reason_type": reasonTypeForQuit,
        "quit_explanation": quitExplanation,
        "nationality": nationality,
        "gender": getGender() ?? "",
        "blood_type": getBloodtype() ?? "",
        "bank_name": getBankNames() ?? "",
        "contract_type": getContractType() ?? "",
        "maritalstatus": getMaritalStatus() ?? "",
        "degree_of_disability": getDisabledDegree() ?? "",
        "military_service_status": getMilitaryStatus() ?? "",
        "employment_type": getEmploymentType() ?? "",
        "bank_account_type": getBankAccountType() ?? "",
        "education_status": getEducationalStatus() ?? "",
        "highest_education_level_completed":
            getHighestEducationLevelCompleted() ?? "",
      };
}

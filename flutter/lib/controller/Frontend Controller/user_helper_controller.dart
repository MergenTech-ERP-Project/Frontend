// ignore_for_file: avoid_print

import 'package:vtys_kalite/enums/bank_account_type.dart';
import 'package:vtys_kalite/enums/bank_names.dart';
import 'package:vtys_kalite/enums/blood_type.dart';
import 'package:vtys_kalite/enums/contract_type.dart';
import 'package:vtys_kalite/enums/disabled_degree.dart';
import 'package:vtys_kalite/enums/educational_status.dart';
import 'package:vtys_kalite/enums/employment_type.dart';
import 'package:vtys_kalite/enums/gender.dart';
import 'package:vtys_kalite/enums/highest_education_level_completed.dart';
import 'package:vtys_kalite/enums/marial_status.dart';
import 'package:vtys_kalite/enums/military_status.dart';
import 'package:vtys_kalite/models/User%20Detail/user_career.dart';
import 'package:vtys_kalite/models/User%20Detail/user_detail.dart';
import 'package:vtys_kalite/models/User%20Detail/user_payment.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class UserHelperController {
  int userId = -1;
  User? user;
  UserDetail? userDetail;
  UserDetailCareer? userDetailCareer;
  UserDetailPayment? userDetailPayment;

  Future<int> init({id}) async {
    userId = id;
    _zeroToAllController();
    await Future.delayed(const Duration(microseconds: 10));
    print("UserHelperController init : $userId , $id");
    await userController.fetchUsers();
    print("users fetched");
    if (userId >= 0) {
      user = await userController.fetchUserById(userId);
      print("User : $userId");
      userDetail = await userDetailController.fetchUserDetailByUserId(userId);
      print("userDetail : $userId");
      userDetailCareer = await userDetailCareerController
          .fetchUserDetailCareerById(userDetail!.id);
      print("userDetailCareer : $userId");
      userDetailPayment = await userDetailPaymentController
          .fetchUserDetailPaymentById(userDetail!.id);
      print("userDetailPayment : $userId");
    } /*  else {
      userId = userController.userList.isEmpty
          ? 0
          : userController.userList.last.id + 1;
      print("null User : $userId");
    } */
    user ??= User(id: userId);
    userDetail ??= UserDetail(userId: user!.id, tcno: user!.id.toString());
    userDetailCareer ??= UserDetailCareer(userDetailId: userDetail!.id);
    userDetailPayment ??= UserDetailPayment(userDetailId: userDetail!.id);
    await Future.delayed(const Duration(milliseconds: 50));
    print("UserHelperController initialized");
    return Future.value(1);
  }

  User getUser() {
    return User(
      name: tabGenelController.controllerName.text +
          (tabGenelController.controllerSurname.text == ""
              ? (" " + tabGenelController.controllerSurname.text)
              : ""),
      email: tabGenelController.controllerEPostaPersonal.text,
      password: user?.password ?? "qwe123",
      title: user?.title ?? "management",
      cellphone: tabGenelController.controllerTelephonePersonal.text,
    );
  }

  UserDetail getUserDetail() {
    return UserDetail(
      id: userDetail?.id ?? -1,
      userId: userId,
      numberofkids:
          int.parse(tabKisiselBilgilerController.controllerNumberOfKids.text),
      tcno: tabKisiselBilgilerController.controllerTcNo.text,
      workPhone: tabGenelController.controllerWorkPhone.text,
      lastCompletedEducationStatus: tabKisiselBilgilerController
          .controllerLastCompletedEducationStatus.text,
      dateofbirth:
          userDetail?.dateofbirth ?? dateTimeFormat.format(DateTime(1970)),
      startDateWork:
          userDetail?.startDateWork ?? dateTimeFormat.format(DateTime(1970)),
      contractEndDate:
          userDetail?.contractEndDate ?? dateTimeFormat.format(DateTime(1970)),
      quitWorkDate:
          userDetail?.contractEndDate ?? dateTimeFormat.format(DateTime(1970)),
      workEmail: tabGenelController.controllerEPostaWork.value.text,
      address: tabDigerBilgilerController.controllerAdress.text,
      addressCountry: tabDigerBilgilerController.controllerCountry.text,
      addressDistrict: tabDigerBilgilerController.controllerDistrict.text,
      addressCity: tabDigerBilgilerController.controllerCity.text,
      addressZipCode: tabDigerBilgilerController.controllerZipCode.text,
      homePhone: tabDigerBilgilerController.controllerHomePhone.text,
      bankAccountNumber:
          tabDigerBilgilerController.controllerAccountNumber.text,
      iban: tabDigerBilgilerController.controllerIBAN.text,
      emergencyContactPerson: "",
      relationshipEmergencyContact: "",
      emergencyContactCellPhone: "",
      reasonTypeForQuit: "",
      quitExplanation: "",
      nationality: tabKisiselBilgilerController.controllerNationality.text,
      gender: GenderEnum.values.elementAt(userDetail?.gender.index ?? 0),
      bloodType:
          BloodTypeEnum.values.elementAt(userDetail?.bloodType.index ?? 0),
      bankNames:
          BankNamesEnum.values.elementAt(userDetail?.bankNames.index ?? 0),
      contractType: ContractTypeEnum.values
          .elementAt(userDetail?.contractType.index ?? 0),
      maritalStatus: MaritalStatusEnum.values
          .elementAt(userDetail?.maritalStatus.index ?? 0),
      disabledDegree: DisabledDegreeEnum.values
          .elementAt(userDetail?.disabledDegree.index ?? 0),
      militaryStatus: MilitaryStatusEnum.values
          .elementAt(userDetail?.employmentType.index ?? 0),
      employmentType: EmploymentTypeEnum.values
          .elementAt(userDetail?.employmentType.index ?? 0),
      bankAccountType: BankAccountTypeEnum.values
          .elementAt(userDetail?.bankAccountType.index ?? 0),
      educationalStatus: EducationalStatusEnum.values
          .elementAt(userDetail?.educationalStatus.index ?? 0),
      highestEducationLevelCompleted: HighestEducationLevelCompletedEnum.values
          .elementAt(userDetail?.highestEducationLevelCompleted.index ?? 0),
    );
  }

  UserDetailCareer getUserDetailCareer() {
    userDetailCareer!.userDetailId = userDetail?.id ?? -1;
    return userDetailCareer!;
  }

  UserDetailPayment getUserDetailPayment() {
    userDetailPayment!.userDetailId = userDetail?.id ?? -1;
    return userDetailPayment!;
  }

  setUserDetail() {
    if (userDetail == null) return;
    tabKisiselBilgilerController.controllerNumberOfKids.text =
        userDetail!.numberofkids.toString();
    tabKisiselBilgilerController.controllerTcNo.text = userDetail!.tcno;
    tabGenelController.controllerWorkPhone.text = userDetail!.workPhone;
    tabKisiselBilgilerController.controllerLastCompletedEducationStatus.text =
        userDetail!.lastCompletedEducationStatus;
    tabGenelController.controllerEPostaWork.text = userDetail!.workEmail;
    tabDigerBilgilerController.controllerAdress.text = userDetail!.address;

    tabDigerBilgilerController.controllerCountry.text =
        userDetail!.addressCountry;
    tabDigerBilgilerController.controllerDistrict.text =
        userDetail!.addressDistrict;
    tabDigerBilgilerController.controllerCity.text = userDetail!.addressCity;

    tabDigerBilgilerController.controllerZipCode.text =
        userDetail!.addressZipCode;

    tabDigerBilgilerController.controllerHomePhone.text = userDetail!.homePhone;

    tabDigerBilgilerController.controllerAccountNumber.text =
        userDetail!.bankAccountNumber;

    tabDigerBilgilerController.controllerIBAN.text = userDetail!.iban;

    tabKisiselBilgilerController.controllerNationality.text =
        userDetail!.nationality;
  }

  userDetailSave({required int index}) async {
    try {
      if (index == 0) {
        if (user!.id == -1) {
          await userController.addNewUser(
            user: getUser(),
          );
        } else {
          await userController.updateUser(
            id: user!.id,
            user: getUser(),
          );
        }
        if (userDetail!.id == -1) {
          await userDetailController.addNewUserDetail(
            detail: getUserDetail(),
          );
        } else {
          await userDetailController.updateUserDetail(
            id: userDetail!.id,
            userDetail: getUserDetail(),
          );
        }
      } else if (index == 1) {
        if (userDetailCareer!.id == -1) {
          await userDetailCareerController.addNewUserDetailCareer(
            career: getUserDetailCareer(),
          );
        } else {
          await userDetailCareerController.updateUserDetailCareer(
            id: userDetailCareer!.id,
            career: getUserDetailCareer(),
          );
        }
        if (userDetailPayment!.id == -1) {
          await userDetailPaymentController.addNewUserDetailPayment(
            payment: getUserDetailPayment(),
          );
        } else {
          await userDetailPaymentController.updateUserDetailPayment(
            id: userDetailCareer!.id,
            payment: getUserDetailPayment(),
          );
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  _zeroToAllController() {
    tabGenelController.controllerName.text = "";
    tabGenelController.controllerSurname.text = "";
    tabGenelController.controllerEPostaWork.text = "";
    tabGenelController.controllerEPostaPersonal.text = "";
    tabGenelController.controllerWorkPhone.text = "";
    tabGenelController.controllerTelephonePersonal.text = "";
    tabGenelController.controllerAccessType.text = "";
    tabGenelController.controllerContractEndDate.text = "";

    tabDigerBilgilerController.controllerAdress.text = "";
    tabDigerBilgilerController.controllerHomePhone.text = "";
    tabDigerBilgilerController.controllerCountry.text = "";
    tabDigerBilgilerController.controllerCity.text = "";
    tabDigerBilgilerController.controllerZipCode.text = "";
    tabDigerBilgilerController.controllerDistrict.text = "";
    tabDigerBilgilerController.controllerAccountNumber.text = "";
    tabDigerBilgilerController.controllerIBAN.text = "";

    tabKariyerController.positionUnvan.text = "";
    tabKariyerController.positionYoneticisi.text = "";
    tabKariyerController.controllerPaymentSalary.text = "";
    tabKariyerController.controllerPaymentUnit.text = "";
    tabKariyerController.controllerPaymentName.text = "";

    tabKisiselBilgilerController.controllerTcNo.text = "";
    tabKisiselBilgilerController.controllerNationality.text = "";
    tabKisiselBilgilerController.controllerNumberOfKids.text = "";
    tabKisiselBilgilerController.controllerLastCompletedEducationStatus.text =
        "";

    user = User(id: userId);
    userDetail = UserDetail(userId: user!.id, tcno: user!.id.toString());
    userDetailCareer = UserDetailCareer(userDetailId: userDetail!.id);
    userDetailPayment = UserDetailPayment(userDetailId: userDetail!.id);
  }
}

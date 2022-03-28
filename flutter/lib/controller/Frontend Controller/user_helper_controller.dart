// ignore_for_file: avoid_print

import 'package:get/get.dart';
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

class UserHelperController extends GetxController {
  int userId = -1;
  User? user;
  UserDetail? userDetail;
  UserDetailCareer? userDetailCareer;
  UserDetailPayment? userDetailPayment;

  Future<int> init({id}) async {
    userId = id;
    await Future.delayed(const Duration(microseconds: 10));
    print("UserHelperController init : $userId");
    await userController.fetchUsers();
    print("users fetched");
    await Future.delayed(const Duration(microseconds: 10));
    print("User : $userId");
    if (userId != -1) {
      user = await userController.fetchUserById(userId);
      print("User : $userId");
      userDetail = await userDetailController.fetchUserDetailByUserId(userId);
      print("userDetail : $userId");
      print("userDetailCareer : $userId");
      userDetailCareer = await userDetailCareerController
          .fetchUserDetailCareerById(userDetail!.id);
      print("userDetailPayment : $userId");
      userDetailPayment = await userDetailPaymentController
          .fetchUserDetailPaymentById(userDetail!.id);
    } else {
      userId = userController.userList.isEmpty
          ? 0
          : userController.userList.last.id + 1;
      user = User(id: userId);
      userDetail = UserDetail(userId: user!.id, tcno: user!.id.toString());
    }
    userDetailCareer ??= UserDetailCareer(userDetailId: userDetail!.id);
    userDetailPayment ??= UserDetailPayment(userDetailId: userDetail!.id);
    print("UserHelperController initialized");
    return Future.value(1);
  }

  UserDetail getUserDetail() {
    return UserDetail(
      id: userDetail != null ? userDetail!.id : -1,
      userId: userId,
      numberofkids:
          int.parse(tabKisiselBilgilerController.controllerNumberOfKids.text),
      tcno: tabKisiselBilgilerController.controllerTcNo.text,
      workPhone: tabGenelController.controllerWorkPhone.text,
      lastCompletedEducationStatus: tabKisiselBilgilerController
          .controllerLastCompletedEducationStatus.text,
      dateofbirth: userDetail!.dateofbirth,
      startDateWork: userDetail!.startDateWork,
      contractEndDate: userDetail!.contractEndDate,
      quitWorkDate: userDetail!.contractEndDate,
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
      gender: GenderEnum.values.elementAt(userDetail!.gender.index),
      bloodType: BloodTypeEnum.values.elementAt(userDetail!.bloodType.index),
      bankNames: BankNamesEnum.values.elementAt(userDetail!.bankNames.index),
      contractType:
          ContractTypeEnum.values.elementAt(userDetail!.contractType.index),
      maritalStatus:
          MaritalStatusEnum.values.elementAt(userDetail!.maritalStatus.index),
      disabledDegree:
          DisabledDegreeEnum.values.elementAt(userDetail!.disabledDegree.index),
      militaryStatus:
          MilitaryStatusEnum.values.elementAt(userDetail!.employmentType.index),
      employmentType:
          EmploymentTypeEnum.values.elementAt(userDetail!.employmentType.index),
      bankAccountType: BankAccountTypeEnum.values
          .elementAt(userDetail!.bankAccountType.index),
      educationalStatus: EducationalStatusEnum.values
          .elementAt(userDetail!.educationalStatus.index),
      highestEducationLevelCompleted: HighestEducationLevelCompletedEnum.values
          .elementAt(userDetail!.highestEducationLevelCompleted.index),
    );
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

  userDetailSave() async {
    try {
      if (userId == -1) {
        await userController.addNewUser(
          user: User(
            name: tabGenelController.controllerName.text +
                (tabGenelController.controllerSurname.text == ""
                    ? (" " + tabGenelController.controllerSurname.text)
                    : ""),
            email: tabGenelController.controllerEPostaPersonal.text,
            password: "qwe123",
            title: "management",
            cellphone: tabGenelController.controllerTelephonePersonal.text,
          ),
        );
      } else {
        await userController.updateUser(
          id: user!.id,
          user: User(
            name: tabGenelController.controllerName.text +
                (tabGenelController.controllerSurname.text == ""
                    ? (" " + tabGenelController.controllerSurname.text)
                    : ""),
            email: tabGenelController.controllerEPostaPersonal.text,
            password: user!.password,
            title: user!.title,
            cellphone: tabGenelController.controllerTelephonePersonal.text,
          ),
        );
      }

      /*! detail vs için herbir request i ayır
      * add new employee sayfasını yeni route a çek dialogdan yani çıkart
      * herbir request i kendi sayfasında yap
      !*/
    } catch (e) {
      print(e.toString());
    }
  }

  zeroToAllController() {
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

    userDetail = UserDetail(userId: userId, tcno: userId.toString());
    userDetailCareer = UserDetailCareer(userDetailId: userDetail!.id);
    userDetailPayment = UserDetailPayment(userDetailId: userDetail!.id);
  }
}

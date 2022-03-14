// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
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
import 'package:vtys_kalite/enums/payment_scheme.dart';
import 'package:vtys_kalite/enums/salary_type.dart';
import 'package:vtys_kalite/models/User%20Detail/user_career.dart';
import 'package:vtys_kalite/models/User%20Detail/user_detail.dart';
import 'package:vtys_kalite/models/User%20Detail/user_payment.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/add_new_employee_helpers.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class UserHelperController {
  final int userId;
  late UserDetail userDetail;
  late UserDetailCareer userDetailCareer;
  late UserDetailPayment userDetailPayment;

  UserHelperController(this.userId) {
    ///TODO: fetch yapılacak burada!!!
    userDetail = UserDetail(
      userId: userId,
      bankAccountType: BankAccountTypeEnum.values.first,
      bankNames: BankNamesEnum.values.first,
      bloodType: BloodTypeEnum.values.first,
      contractType: ContractTypeEnum.values.first,
      disabledDegree: DisabledDegreeEnum.values.first,
      educationalStatus: EducationalStatusEnum.values.first,
      employmentType: EmploymentTypeEnum.values.first,
      gender: GenderEnum.values.first,
      highestEducationLevelCompleted:
          HighestEducationLevelCompletedEnum.values.first,
      maritalStatus: MaritalStatusEnum.values.first,
      militaryStatus: MilitaryStatusEnum.values.first,
    );
    userDetailCareer = UserDetailCareer(userDetailId: userDetail.id);
    userDetailPayment = UserDetailPayment(userDetailId: userDetail.id);
  }

  userDetailSave(BuildContext context, user) async {
    int userId = 0;
    if (user == null) {
      await userController.addNewUser(
        tabGenelController.controllerName.text +
            tabGenelController.controllerSurname.text,
        tabGenelController.controllerEPostaPersonal.text,
        "qwe123",
        tabGenelController.controllerTelephonePersonal.text,
      );
      userId = await userController.fetchUserByEmailAndPassword(
          tabGenelController.controllerEPostaPersonal.text, "qwe123");
    } else {
      user!.name = tabGenelController.controllerName.text +
          " " +
          tabGenelController.controllerSurname.text;
      user!.email = tabGenelController.controllerEPostaPersonal.text;
      user!.cellphone = tabGenelController.controllerTelephonePersonal.text;
      userController.updateUser(
        user!.id,
        user!,
      );
      userId = user!.id;
    }

    print("User Helper User Created / Updated ID: $userId");

    UserDetail? userDetail =
        await userDetailController.fetchUserDetailByUserId(userId);

    print("User Helper User UserDetail " +
        (userDetail == null ? "not found" : "found ID: ${userDetail.id}"));

    int? responseUserDetail = (userDetail == null
        ? await userDetailController.addNewUserDetail(
            UserDetail(
                userId: userId,
                tcno: tabKisiselBilgilerController.controllerTcNo.text,
                dateofbirth: this.userDetail.dateofbirth,
                workPhone: tabGenelController.controllerWorkPhone.text,
                maritalStatus: MaritalStatusEnum.values
                    .elementAt(this.userDetail.maritalStatus.index),
                numberofkids:
                    tabKisiselBilgilerController.controllerNumberOfKids.text,
                disabledDegree: DisabledDegreeEnum.values
                    .elementAt(this.userDetail.disabledDegree.index),
                gender:
                    GenderEnum.values.elementAt(this.userDetail.gender.index),
                educationalStatus: EducationalStatusEnum.values
                    .elementAt(this.userDetail.educationalStatus.index),
                highestEducationLevelCompleted:
                    HighestEducationLevelCompletedEnum.values.elementAt(
                        this.userDetail.highestEducationLevelCompleted.index),
                lastCompletedEducationStatus: tabKisiselBilgilerController
                    .controllerLastCompletedEducationStatus.text,
                employmentType: EmploymentTypeEnum.values
                    .elementAt(this.userDetail.employmentType.index),
                militaryStatus: MilitaryStatusEnum.values
                    .elementAt(this.userDetail.employmentType.index),
                startDateWork: this.userDetail.startDateWork,
                contractType: ContractTypeEnum.values
                    .elementAt(this.userDetail.contractType.index),
                contractEndDate: this.userDetail.contractEndDate,
                workEmail: tabGenelController.controllerEPostaWork.value.text,
                address: tabDigerBilgilerController.controllerAdress.text,
                addressCountry:
                    tabDigerBilgilerController.controllerCountry.text,
                addressDistrict:
                    tabDigerBilgilerController.controllerDistrict.text,
                addressCity: tabDigerBilgilerController.controllerCity.text,
                addressZipCode:
                    tabDigerBilgilerController.controllerZipCode.text,
                homePhone: tabDigerBilgilerController.controllerHomePhone.text,
                bankNames: BankNamesEnum.values
                    .elementAt(this.userDetail.bankNames.index),
                bankAccountType: BankAccountTypeEnum.values.elementAt(this.userDetail.bankAccountType.index),
                bankAccountNumber: tabDigerBilgilerController.controllerAccountNumber.text,
                iban: tabDigerBilgilerController.controllerIBAN.text,

                ///TODO: bunları unutma!!
                emergencyContactPerson: "Ömer Faruk Öztürk",
                relationshipEmergencyContact: "Boss",
                emergencyContactCellPhone: "05436176299",
                quitWorkDate: this.userDetail.contractEndDate,
                reasonTypeForQuit: "Ömer Faruk Kovdu Hepsini Muhahaha",
                reasonExplainForQuit: "Yok açıklama. Kovdum ahaha",
                bloodType: BloodTypeEnum.values.elementAt(this.userDetail.bloodType.index),
                nationality: tabKisiselBilgilerController.controllerNationality.text),
          )
        : await userDetailController.updateUserDetail(
            userDetail.id, userDetail));

    userDetail = await userDetailController.fetchUserDetailByUserId(userId);

    print("User Helper new User UserDetail found ID: ${userDetail!.id}");

    UserDetailCareer? userDetailCareer = await userDetailCareerController
        .fetchUserDetailCareerById(userDetail.id);

    print("User Helper User UserDetailCareer " +
        (userDetailCareer == null
            ? "not found"
            : "found ID: ${userDetailCareer.id}"));

    ///TODO: userDetail!.id,

    int? responseUserDetailCareer;
    if ((userDetailCareer == null)) {
      responseUserDetailCareer =
          await userDetailCareerController.addNewUserDetailCareer(
        userDetail.id,
        UserDetailCareer(
          userDetailId: userDetail.id,
          managerName: tabKariyerController.positionYoneticisi.text,
          managerTcno: "12345678910", //TODO
          unitCompany: companyController
              .companyList[tabKariyerController.unitCompanyIndex.value]
              .companyName,
          unitBranch: branchController
              .branchList[tabKariyerController.unitBranchIndex.value]
              .branchName,
          unitDepartment: departmentController
              .departmentList[tabKariyerController.unitDepartmantIndex.value]
              .departmentName,
          unitTitle: "Fakir Parası", //TODO
        ),
      );
    } else {
      responseUserDetailCareer = await userDetailCareerController
          .updateUserDetailCareer(userDetail.id, userDetailCareer);
    }

    int? responseUserDetailPayment =

        ///TODO: update kaldı
        await userDetailPaymentController.addNewUserDetailPayment(
      userDetail.id,
      UserDetailPayment(
        userDetailId: userDetail.id,
        tcno: tabKisiselBilgilerController.controllerTcNo.text,
        salary: tabKariyerController.controllerSalary.text,
        currency: "TL", //TODO
        salaryType: SalaryTypeEnum.gross,
        paymentScheme: PaymentSchemeEnum.monthly,
        commuteSupportFee: "617",
        foodSupportFee: "6299",
      ),
    );

    showDialogResponseCheck(
      responseUserDetail!,
      responseUserDetailCareer!,
      responseUserDetailPayment!,
      context,
    );
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
    userDetail.contractType = ContractTypeEnum.values.first;
    userDetail.employmentType = EmploymentTypeEnum.values.first;
    userDetail.startDateWork = dateTimeFormat.format(DateTime.now());
    userDetail.contractEndDate = dateTimeFormat.format(DateTime.now());

    tabDigerBilgilerController.controllerAdress.text = "";
    tabDigerBilgilerController.controllerHomePhone.text = "";
    tabDigerBilgilerController.controllerCountry.text = "";
    tabDigerBilgilerController.controllerCity.text = "";
    tabDigerBilgilerController.controllerZipCode.text = "";
    tabDigerBilgilerController.controllerDistrict.text = "";
    tabDigerBilgilerController.controllerAccountNumber.text = "";
    tabDigerBilgilerController.controllerIBAN.text = "";
    userDetail.bankNames = BankNamesEnum.values.first;
    userDetail.bankAccountType = BankAccountTypeEnum.values.first;

    userDetailCareer.unitCompany = "";
    userDetailCareer.unitBranch = "";
    userDetailCareer.unitDepartment = "";
    userDetailCareer.unitTitle = "";
    tabKariyerController.positionUnvan.text = "";
    tabKariyerController.positionYoneticisi.text = "";
    tabKariyerController.controllerSalary.text = "";
    tabKariyerController.controllerUnit.text = "";
    tabKariyerController.controllerPaymentScreenInSalary.text = "";

    userDetail.dateofbirth = dateTimeFormat.format(DateTime.now());
    tabKisiselBilgilerController.controllerTcNo.text = "";
    tabKisiselBilgilerController.controllerNationality.text = "";
    tabKisiselBilgilerController.controllerNumberOfKids.text = "";
    tabKisiselBilgilerController.controllerLastCompletedEducationStatus.text =
        "";
    userDetail.nationality = "";
    userDetail.maritalStatus = MaritalStatusEnum.values.first;
    userDetail.gender = GenderEnum.values.first;
    userDetail.disabledDegree = DisabledDegreeEnum.values.first;
    userDetail.bloodType = BloodTypeEnum.values.first;
    userDetail.educationalStatus = EducationalStatusEnum.values.first;
    userDetail.highestEducationLevelCompleted =
        HighestEducationLevelCompletedEnum.values.first;
    userDetail.militaryStatus = MilitaryStatusEnum.values.first;
  }
}

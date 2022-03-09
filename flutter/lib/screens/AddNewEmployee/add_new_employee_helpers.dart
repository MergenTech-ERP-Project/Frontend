import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_alert_dialog.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
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
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/models/User%20Detail/user_career.dart';
import 'package:vtys_kalite/models/User%20Detail/user_detail.dart';
import 'package:vtys_kalite/models/User%20Detail/user_payment.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class UserHelperController {
  final int userId;
  late UserDetail userDetail;
  late UserDetailCareer userDetailCareer;
  late UserDetailPayment userDetailPayment;

  UserHelperController(this.userId, {UserHelperController? userHelper}) {
    ///TODO: fetch yapılacak burada!!!
    if (userHelper == null) {
      userDetail = UserDetail();
      userDetailCareer = UserDetailCareer();
      userDetailPayment = UserDetailPayment();
    } else {
      userDetail = userHelper.userDetail;
      userDetailCareer = userHelper.userDetailCareer;
      userDetailPayment = userHelper.userDetailPayment;
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

    ///TODO: COMPANY BRANCH DEPARTMANT TITLE
    //userDetailCareer.unitCompany = null;
    // userDetailCareer.unitBranch = null;
    // userDetailCareer.unitDepartment = null;
    // userDetailCareer.unitTitle = null;
    tabKariyerController.positionUnvan.text = "";
    tabKariyerController.positionYoneticisi.text = "";
    tabKariyerController.controllerSalary.text = "";
    tabKariyerController.controllerUnit.text = "";
    tabKariyerController.controllerPaymentScreenInSalary.text = "";

    userDetail.dateofbirth = dateTimeFormat.format(DateTime.now());
    tabKisiselBilgilerController.controllerTcNo.text = "";
    tabKisiselBilgilerController.controllerNationality.text = "";
    tabKisiselBilgilerController.controllerNumberOfKids.text = "";
    tabKisiselBilgilerController.controllerEdicationStatus.text = "";
    tabKisiselBilgilerController.controllerLastCompletedEducationStatus.text =
        "";
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

showDialogResponseCheck(
  int responseUserDetail,
  int responseUserDetailCareer,
  int responseUserDetailPayment,
  context,
) {
  if (responseUserDetail < 200 || responseUserDetail >= 300) {
    showDialog(
      context: context,
      builder: (_) => CustomAlertDialog(
        titleWidget: const CustomText(
            text: "Kayıt Esnasında Bir Hata İle Karşılaşıldı."),
        bodyWidget: const SizedBox(),
        bodyWidgetWidth: MediaQuery.of(context).size.width / 3,
      ),
    );
    return;
  }

  if (responseUserDetailCareer < 200 || responseUserDetailCareer >= 300) {
    showDialog(
      context: context,
      builder: (_) => CustomAlertDialog(
        titleWidget: const CustomText(
            text: "Kayıt Esnasında Bir Hata İle Karşılaşıldı."),
        bodyWidget: const SizedBox(),
        bodyWidgetWidth: MediaQuery.of(context).size.width / 3,
      ),
    );
    return;
  }

  if (responseUserDetailPayment < 200 || responseUserDetailPayment >= 300) {
    showDialog(
      context: context,
      builder: (_) => CustomAlertDialog(
        titleWidget: const CustomText(
            text: "Kayıt Esnasında Bir Hata İle Karşılaşıldı."),
        bodyWidget: const SizedBox(),
        bodyWidgetWidth: MediaQuery.of(context).size.width / 3,
      ),
    );
    return;
  }
}

showInformationWhenOnClick() {
  var lastSpace = user.name.lastIndexOf(' ');
  String name = lastSpace != -1 ? user.name.substring(0, lastSpace) : user.name;
  String surname = lastSpace != -1 ? user.name.substring(lastSpace + 1) : "";

  ///null döndürüyor.

  tabGenelController.controllerName.text = name;
  tabGenelController.controllerSurname.text = surname;
  // tabGenelController.controllerEPostaWork.text = userDetail!.workEmail!;
  // tabGenelController.controllerWorkPhone.text = userDetail!.workPhone!;
  tabGenelController.controllerEPostaPersonal.text = user.email;
  tabGenelController.controllerTelephonePersonal.text = user.cellphone;
  // tabGenelController.dateOfStart =
  //     dateTimeFormat.parse(userDetail!.startDateWork!);
  // tabGenelController.contractEndDate =
  //     dateTimeFormat.parse(userDetail!.contractEndDate!);
  // tabGenelController.contractTypeIndex =
  //     ContractTypeEnum.values.indexOf(userDetail!.contractType!);
  // tabGenelController.employmentTypeIndex =
  //      EmploymentTypeEnum.values.indexOf(userDetail!.employmentType!);
}

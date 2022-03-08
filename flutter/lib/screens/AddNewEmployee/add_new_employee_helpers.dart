import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_alert_dialog.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

zeroToAllController() {
  tabGenelController.controllerName.text = "";
  tabGenelController.controllerSurname.text = "";
  tabGenelController.controllerEPostaWork.text = "";
  tabGenelController.controllerEPostaPersonal.text = "";
  tabGenelController.controllerWorkPhone.text = "";
  tabGenelController.controllerTelephonePersonal.text = "";
  tabGenelController.controllerAccessType.text = "";
  tabGenelController.controllerContractEndDate.text = "";
  tabGenelController.contractTypeIndex = 0;
  tabGenelController.employmentTypeIndex = 0;
  tabGenelController.dateOfStart = DateTime.now();
  tabGenelController.contractEndDate = DateTime.now();

  tabDigerBilgilerController.controllerAdress.text = "";
  tabDigerBilgilerController.controllerHomePhone.text = "";
  tabDigerBilgilerController.controllerCountry.text = "";
  tabDigerBilgilerController.controllerCity.text = "";
  tabDigerBilgilerController.controllerZipCode.text = "";
  tabDigerBilgilerController.controllerDistrict.text = "";
  tabDigerBilgilerController.controllerAccountNumber.text = "";
  tabDigerBilgilerController.controllerIBAN.text = "";
  tabDigerBilgilerController.bankNameIndex = 0;
  tabDigerBilgilerController.bankAccountTypeIndex = 0;

  tabKariyerController.positionSirketIndex = 0;
  tabKariyerController.positionSubeIndex = 0;
  tabKariyerController.positionDepartmanIndex = 0;
  tabKariyerController.positionUnvan.text = "";
  tabKariyerController.positionYoneticisi.text = "";
  tabKariyerController.controllerSalary.text = "";
  tabKariyerController.controllerUnit.text = "";
  tabKariyerController.controllerPaymentScreenInSalary.text = "";
  tabKariyerController.positionDateTimeBaslangic = DateTime.now();
  tabKariyerController.positionDateTimeBitis = DateTime.now();
  tabKariyerController.gecerlilikBaslangic = DateTime.now();

  tabKisiselBilgilerController.birthDate = DateTime.now();
  tabKisiselBilgilerController.controllerTcNo.text = "";
  tabKisiselBilgilerController.controllerNationality.text = "";
  tabKisiselBilgilerController.controllerNumberOfKids.text = "";
  tabKisiselBilgilerController.controllerEdicationStatus.text = "";
  tabKisiselBilgilerController.controllerLastCompletedEducationStatus.text = "";
  tabKisiselBilgilerController.maritalStatusIndex = 0;
  tabKisiselBilgilerController.genderIndex = 0;
  tabKisiselBilgilerController.disabledDegreeIndex = 0;
  tabKisiselBilgilerController.bloodGroupIndex = 0;
  tabKisiselBilgilerController.educationalStatusIndex = 0;
  tabKisiselBilgilerController.highestEducationLevelCompletedIndex = 0;
  tabKisiselBilgilerController.militaryStatusIndex = 0;
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

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_alert_dialog.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

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
  String name = "";
  String surname = "";
  if (userHelper.user != null) {
    var lastSpace = userHelper.user!.name.lastIndexOf(' ');
    name = lastSpace != -1
        ? userHelper.user!.name.substring(0, lastSpace)
        : userHelper.user!.name;
    surname =
        lastSpace != -1 ? userHelper.user!.name.substring(lastSpace + 1) : "";
  }

  ///sadece controller var

  tabGenelController.controllerName.text = name;
  tabGenelController.controllerSurname.text = surname;
  tabGenelController.controllerEPostaWork.text =
      userHelper.userDetail!.workEmail;
  tabGenelController.controllerWorkPhone.text =
      userHelper.userDetail!.workPhone;
  tabGenelController.controllerEPostaPersonal.text =
      userHelper.user != null ? userHelper.user!.email : "";
  tabGenelController.controllerTelephonePersonal.text =
      userHelper.user != null ? userHelper.user!.cellphone : "";

  tabKariyerController.positionUnvan.text =
      userHelper.userDetailCareer!.unitTitle;
  tabKariyerController.positionYoneticisi.text =
      userHelper.userDetailCareer!.adminName;

  tabKariyerController.controllerPaymentSalary.text =
      userHelper.userDetailPayment!.salary;

  tabKariyerController.controllerPaymentUnit.text =
      userHelper.userDetailPayment!.currency;

  tabDigerBilgilerController.controllerAdress.text =
      userHelper.userDetail!.address;

  tabDigerBilgilerController.controllerHomePhone.text =
      userHelper.userDetail!.homePhone;

  tabDigerBilgilerController.controllerCountry.text =
      userHelper.userDetail!.addressCountry;

  tabDigerBilgilerController.controllerCity.text =
      userHelper.userDetail!.addressCity;

  tabDigerBilgilerController.controllerZipCode.text =
      userHelper.userDetail!.addressZipCode;

  tabDigerBilgilerController.controllerDistrict.text =
      userHelper.userDetail!.addressDistrict;

  tabDigerBilgilerController.controllerAccountNumber.text =
      userHelper.userDetail!.bankAccountNumber;

  tabDigerBilgilerController.controllerIBAN.text = userHelper.userDetail!.iban;

  tabKisiselBilgilerController.controllerTcNo.text =
      userHelper.userDetail!.bankAccountNumber;

  tabKisiselBilgilerController.controllerNationality.text =
      userHelper.userDetail!.nationality;

  tabKisiselBilgilerController.controllerNumberOfKids.text =
      userHelper.userDetail!.numberofkids.toString();

  tabKisiselBilgilerController.controllerLastCompletedEducationStatus.text =
      userHelper.userDetail!.lastCompletedEducationStatus;
}

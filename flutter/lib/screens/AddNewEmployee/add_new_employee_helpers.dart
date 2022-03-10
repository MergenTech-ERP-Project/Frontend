import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_alert_dialog.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/main.dart';
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

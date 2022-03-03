// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/enums/contract_type.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_customdatetimepicker.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_customdropdownmenu.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_name_controller.dart';

class TabGenelSecondCard extends StatelessWidget {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerSurname = TextEditingController();
  TextEditingController controllerEPostaWork = TextEditingController();
  TextEditingController controllerEPostaPersonal = TextEditingController();
  TextEditingController controllerTelephoneWork = TextEditingController();
  TextEditingController controllerTelephonePersonal = TextEditingController();

  TextEditingController controllerAccessType = TextEditingController();
  int contractTypeIndex = 0;

  TextEditingController controllerContractEndDate = TextEditingController();

  DateTime dateOfStart = DateTime.now();
  DateTime contractEndDate = DateTime.now();

  User? user;

  TabGenelSecondCard({Key? key, this.user}) : super(key: key) {
    user ??= User();
    var lastSpace = user!.name.lastIndexOf(' ');
    String name =
        lastSpace != -1 ? user!.name.substring(0, lastSpace) : user!.name;
    String surname = lastSpace != -1 ? user!.name.substring(lastSpace + 1) : "";

    controllerName.text = name;
    controllerSurname.text = surname;

    controllerEPostaPersonal.text = user!.email;

    controllerTelephonePersonal.text = user!.cellphone;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: aboutPersonal(),
    );
  }

  Widget aboutPersonal() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: CustomText(
            text: "Genel Bilgiler",
          ),
        ),
        Row(
          children: [
            ExpandedNameController(
              controller: controllerName,
              label: "Ad",
              widget: const SizedBox(),
            ),
            ExpandedNameController(
              controller: controllerSurname,
              label: "Soyad",
              widget: const SizedBox(),
            ),
          ],
        ),
        Row(
          children: [
            ExpandedNameController(
              controller: controllerEPostaWork,
              label: "E-Posta (İş)",
              widget: const SizedBox(),
            ),
            ExpandedNameController(
              controller: controllerEPostaPersonal,
              label: "E-Posta (Genel)",
              widget: const SizedBox(),
            ),
          ],
        ),
        Row(
          children: [
            ExpandedNameController(
              controller: controllerTelephoneWork,
              label: "Telefon (İş)",
              widget: const SizedBox(),
            ),
            ExpandedNameController(
              controller: controllerTelephonePersonal,
              label: "Telefon (Kişisel)",
              widget: const SizedBox(),
            ),
          ],
        ),
        Row(
          children: [
            ExpandedCustomDateTimePicker(
              label: "İşe Başlangıç Tarihi",
              dateTime: dateOfStart,
            ),
            ExpandedCustomDateTimePicker(
              label: "Sözleşme Bitiş Tarihi",
              dateTime: contractEndDate,
            ),
          ],
        ),
        Row(
          children: [
            ExpandedCustomDropDownMenu(
              label: "Sözleşme Türü",
              index: contractTypeIndex,
              listExtension: ContractTypeExtension.getList(),
            ),
            ExpandedNameController(
              controller: controllerAccessType,
              label: "Erişim Türü",
              widget: const Icon(Icons.keyboard_arrow_down),
            ),
          ],
        ),
      ],
    );
  }
}

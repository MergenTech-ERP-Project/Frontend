// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/enums/contract_type.dart';
import 'package:vtys_kalite/enums/type_of_working.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_customdatetimepicker.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_customdropdownmenu.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_name_controller.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class TabGenelSecondCard extends StatelessWidget {
  User? user;

  TabGenelSecondCard({Key? key, this.user}) : super(key: key);

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
              controller: tabGenelController.controllerName,
              label: "Ad",
              widget: const SizedBox(),
            ),
            ExpandedNameController(
              controller: tabGenelController.controllerSurname,
              label: "Soyad",
              widget: const SizedBox(),
            ),
          ],
        ),
        Row(
          children: [
            ExpandedNameController(
              controller: tabGenelController.controllerEPostaWork,
              label: "E-Posta (İş)",
              widget: const SizedBox(),
            ),
            ExpandedNameController(
              controller: tabGenelController.controllerEPostaPersonal,
              label: "E-Posta (Genel)",
              widget: const SizedBox(),
            ),
          ],
        ),
        Row(
          children: [
            ExpandedNameController(
              controller: tabGenelController.controllerWorkPhone,
              label: "Telefon (İş)",
              widget: const SizedBox(),
            ),
            ExpandedNameController(
              controller: tabGenelController.controllerTelephonePersonal,
              label: "Telefon (Kişisel)",
              widget: const SizedBox(),
            ),
          ],
        ),
        Row(
          children: [
            ExpandedCustomDateTimePicker(
              label: "İşe Başlangıç Tarihi",
              dateTime: tabGenelController.dateOfStart,
            ),
            ExpandedCustomDateTimePicker(
              label: "Sözleşme Bitiş Tarihi",
              dateTime: tabGenelController.contractEndDate,
            ),
          ],
        ),
        Row(
          children: [
            ExpandedCustomDropDownMenu(
              label: "Sözleşme Türü",
              index: tabGenelController.contractTypeIndex,
              listExtension: ContractTypeExtension.getList(),
            ),
            ExpandedCustomDropDownMenu(
              label: "Çalışma Şekli",
              index: tabGenelController.employmentTypeIndex,
              listExtension: EmploymentTypeEnumExtension.getList(),
            ),
          ],
        ),
      ],
    );
  }
}

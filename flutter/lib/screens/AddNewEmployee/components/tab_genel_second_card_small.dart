// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/user_helper_controller.dart';
import 'package:vtys_kalite/enums/contract_type.dart';
import 'package:vtys_kalite/enums/employment_type.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_customdatetimepicker.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_customdropdownmenu.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_name_controller.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class TabGenelSecondCardSmall extends StatefulWidget {
  User? user;
  UserHelperController userHelper;

  TabGenelSecondCardSmall({
    Key? key,
    this.user,
    required this.userHelper,
  }) : super(key: key);

  @override
  State<TabGenelSecondCardSmall> createState() =>
      _TabGenelSecondCardSmallState();
}

class _TabGenelSecondCardSmallState extends State<TabGenelSecondCardSmall> {
  @override
  Widget build(BuildContext context) {
    return aboutPersonal();
  }

  Widget aboutPersonal() {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
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
        ExpandedCustomDateTimePicker(
          label: "İşe Başlangıç Tarihi",
          onChanged: (val) {
            if (val != null) {
              try {
                widget.userHelper.userDetail!.startDateWork = val;
              } catch (e) {
                print(e.toString());
              }
            }
          },
        ),
        ExpandedCustomDateTimePicker(
          label: "Sözleşme Bitiş Tarihi",
          onChanged: (val) {
            if (val != null) {
              try {
                widget.userHelper.userDetail!.contractEndDate = val;
              } catch (e) {
                print(e.toString());
              }
            }
          },
        ),
        ExpandedCustomDropDownMenu(
          label: "Sözleşme Türü",
          value: widget.userHelper.userDetail!.contractType.getName,
          listExtension: ContractTypeExtension.getList(),
          onChanged: (val) {
            setState(() {
              widget.userHelper.userDetail!.contractType =
                  ContractTypeExtension.getEnumFromName(val);
            });
          },
        ),
        ExpandedCustomDropDownMenu(
          label: "Çalışma Şekli",
          value: widget.userHelper.userDetail!.employmentType.getName,
          listExtension: EmploymentTypeEnumExtension.getList(),
          onChanged: (val) {
            setState(() {
              widget.userHelper.userDetail!.employmentType =
                  EmploymentTypeEnumExtension.getEnumFromName(val);
            });
          },
        ),
        const Expanded(child: SizedBox(height: 50)),
      ],
    );
  }
}

class GeneralInformation extends StatelessWidget {
  GeneralInformation({
    Key? key,
    required this.controller,
    required this.label,
    required this.widget,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  Widget widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextBox(
        borderless: true,
        controller: controller,
        label: label,
        suffixWidget: widget,
      ),
    );
  }
}

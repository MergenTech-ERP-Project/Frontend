// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_dropdownitems.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/user_helper_controller.dart';
import 'package:vtys_kalite/enums/contract_type.dart';
import 'package:vtys_kalite/enums/employment_type.dart';
import 'package:vtys_kalite/models/user.dart';
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
        NameController(
          controller: tabGenelController.controllerName,
          label: "Ad",
          widget: const SizedBox(),
        ),
        NameController(
          controller: tabGenelController.controllerSurname,
          label: "Soyad",
          widget: const SizedBox(),
        ),
        NameController(
          controller: tabGenelController.controllerEPostaWork,
          label: "E-Posta (İş)",
          widget: const SizedBox(),
        ),
        NameController(
          controller: tabGenelController.controllerEPostaPersonal,
          label: "E-Posta (Genel)",
          widget: const SizedBox(),
        ),
        NameController(
          controller: tabGenelController.controllerWorkPhone,
          label: "Telefon (İş)",
          widget: const SizedBox(),
        ),
        NameController(
          controller: tabGenelController.controllerTelephonePersonal,
          label: "Telefon (Kişisel)",
          widget: const SizedBox(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CustomDateTimePicker(
            suffixWidget: const Icon(Icons.calendar_today_outlined),
            labelText: "İşe Başlangıç Tarihi",
            borderless: true,
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
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CustomDateTimePicker(
            suffixWidget: const Icon(Icons.calendar_today_outlined),
            labelText: "Sözleşme Bitiş Tarihi",
            borderless: true,
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
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CustomDateTimePicker(
            suffixWidget: const Icon(Icons.calendar_today_outlined),
            labelText: "Sözleşme Bitiş Tarihi",
            borderless: true,
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
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CustomDropDownMenu(
            isExpandedYes: true,
            iconSize: 20,
            text: "Sözleşme Türü",
            valueChoose: widget.userHelper.userDetail!.contractType.getName,
            list: ContractTypeExtension.getList(),
            icon: const Icon(Icons.arrow_drop_down),
            onChanged: (val) {
              setState(() {
                widget.userHelper.userDetail!.contractType =
                    ContractTypeExtension.getEnumFromName(val);
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CustomDropDownMenu(
            text: "Çalışma Şekli",
            valueChoose: widget.userHelper.userDetail!.employmentType.getName,
            list: EmploymentTypeEnumExtension.getList(),
            icon: const Icon(Icons.arrow_drop_down),
            isExpandedYes: true,
            iconSize: 20,
            onChanged: (val) {
              setState(() {
                widget.userHelper.userDetail!.employmentType =
                    EmploymentTypeEnumExtension.getEnumFromName(val);
              });
            },
          ),
        ),
        const Expanded(child: SizedBox(height: 50)),
      ],
    );
  }
}

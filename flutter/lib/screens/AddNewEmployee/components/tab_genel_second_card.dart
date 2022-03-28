// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_dropdownitems.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';

import 'package:vtys_kalite/enums/contract_type.dart';
import 'package:vtys_kalite/enums/employment_type.dart';
import 'package:vtys_kalite/models/user.dart';

import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_name_controller.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class TabGenelSecondCard extends StatefulWidget {
  User? user;

  TabGenelSecondCard({
    Key? key,
    this.user,
  }) : super(key: key);

  @override
  State<TabGenelSecondCard> createState() => _TabGenelSecondCardState();
}

class _TabGenelSecondCardState extends State<TabGenelSecondCard> {
  @override
  Widget build(BuildContext context) {
    return aboutPersonal();
  }

  Widget aboutPersonal() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: CustomText(
            text: "Genel Bilgiler",
            size: 32,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: NameController(
                controller: tabGenelController.controllerName,
                label: "Ad",
                widget: const SizedBox(),
              ),
            ),
            Expanded(
              child: NameController(
                controller: tabGenelController.controllerSurname,
                label: "Soyad",
                widget: const SizedBox(),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: NameController(
                controller: tabGenelController.controllerEPostaPersonal,
                label: "E-Posta (Genel)",
                widget: const SizedBox(),
              ),
            ),
            Expanded(
              child: NameController(
                controller: tabGenelController.controllerEPostaWork,
                label: "E-Posta (İş)",
                widget: const SizedBox(),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: NameController(
                controller: tabGenelController.controllerTelephonePersonal,
                label: "Telefon (Kişisel)",
                widget: const SizedBox(),
              ),
            ),
            Expanded(
              child: NameController(
                controller: tabGenelController.controllerWorkPhone,
                label: "Telefon (İş)",
                widget: const SizedBox(),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomDateTimePicker(
                  suffixWidget: const Icon(Icons.calendar_today_outlined),
                  labelText: "İşe Başlangıç Tarihi",
                  borderless: true,
                  onChanged: (val) {
                    if (val != null) {
                      try {
                        userHelper.userDetail!.startDateWork = val;
                      } catch (e) {
                        print(e.toString());
                      }
                    }
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomDateTimePicker(
                  suffixWidget: const Icon(Icons.calendar_today_outlined),
                  labelText: "Sözleşme Bitiş Tarihi",
                  borderless: true,
                  onChanged: (val) {
                    if (val != null) {
                      try {
                        userHelper.userDetail!.contractEndDate = val;
                      } catch (e) {
                        print(e.toString());
                      }
                    }
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomDropDownMenu(
                    text: "Sözleşme Türü",
                    list: ContractTypeExtension.getList(),
                    valueChoose: userHelper.userDetail!.contractType.getName,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 20,
                    isExpandedYes: true,
                    onChanged: (val) {
                      setState(() {
                        userHelper.userDetail!.contractType =
                            ContractTypeExtension.getEnumFromName(val);
                      });
                    }),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomDropDownMenu(
                  iconSize: 20,
                  text: "Çalışma Şekli",
                  valueChoose: userHelper.userDetail!.employmentType.getName,
                  list: EmploymentTypeEnumExtension.getList(),
                  icon: const Icon(Icons.arrow_drop_down),
                  isExpandedYes: true,
                  onChanged: (val) {
                    setState(() {
                      userHelper.userDetail!.employmentType =
                          EmploymentTypeEnumExtension.getEnumFromName(val);
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ignore_for_file: avoid_print, must_be_immutable

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/user_helper_controller.dart';
import 'package:vtys_kalite/enums/contract_type.dart';
import 'package:vtys_kalite/enums/employment_type.dart';
import 'package:vtys_kalite/models/User%20Detail/user_detail.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_customdatetimepicker.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_customdropdownmenu.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_name_controller.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class TabGenelSecondCard extends StatefulWidget {
  User? user;
  UserHelperController userHelper;

  TabGenelSecondCard({
    Key? key,
    this.user,
    required this.userHelper,
  }) : super(key: key);

  @override
  State<TabGenelSecondCard> createState() => _TabGenelSecondCardState();
}

class _TabGenelSecondCardState extends State<TabGenelSecondCard> {
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
            size: 32,
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
              onChanged: (val) {
                if (val != null) {
                  try {
                    widget.userHelper.userDetail.startDateWork = val;
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
                    widget.userHelper.userDetail.contractEndDate = val;
                  } catch (e) {
                    print(e.toString());
                  }
                }
              },
            ),
          ],
        ),
        Row(
          children: [
            ExpandedCustomDropDownMenu(
              label: "Sözleşme Türü",
              index: widget.userHelper.userDetail.contractType.index,
              listExtension: ContractTypeExtension.getList(),
              onChanged: (val) {
                setState(() {
                  widget.userHelper.userDetail.contractType =
                      EnumToString.fromString(
                          ContractTypeEnum.values, val.toString())!;
                });
              },
            ),
            ExpandedCustomDropDownMenu(
              label: "Çalışma Şekli",
              index: widget.userHelper.userDetail.employmentType.index,
              listExtension: EmploymentTypeEnumExtension.getList(),
              onChanged: (val) {
                setState(() {
                  widget.userHelper.userDetail.employmentType =
                      EnumToString.fromString(
                          EmploymentTypeEnum.values, val.toString())!;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}

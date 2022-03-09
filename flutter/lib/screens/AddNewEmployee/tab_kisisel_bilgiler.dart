// ignore_for_file: avoid_print

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:vtys_kalite/enums/blood_type.dart';
import 'package:vtys_kalite/enums/disabled_degree.dart';
import 'package:vtys_kalite/enums/educational_status.dart';
import 'package:vtys_kalite/enums/gender.dart';
import 'package:vtys_kalite/enums/highest_education_level_completed.dart';
import 'package:vtys_kalite/enums/marial_status.dart';
import 'package:vtys_kalite/enums/military_status.dart';
import 'package:vtys_kalite/models/User%20Detail/user_detail.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_customdatetimepicker.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_customdropdownmenu.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_name_controller.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class TabPersonalInformation extends StatefulWidget {
  final UserDetail userDetail;
  TabPersonalInformation({
    Key? key,
    required this.userDetail,
  }) : super(key: key);

  @override
  _TabPersonalInformationState createState() => _TabPersonalInformationState();
}

class _TabPersonalInformationState extends State<TabPersonalInformation> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            ExpandedCustomDateTimePicker(
              label: "Doğum Tarihi",
              dateTime: dateTimeFormat.parse(widget.userDetail.dateofbirth!),
            ),
            ExpandedNameController(
              controller: tabKisiselBilgilerController.controllerTcNo,
              label: "Kimlik Numarası",
              widget: const SizedBox(),
            ),
          ],
        ),
        Row(
          children: [
            ExpandedCustomDropDownMenu(
              label: "Medeni Hal",
              index: widget.userDetail.maritalStatus!.index,
              listExtension: MaritalStatusExtension.getList(),
              onChanged: (val) {
                setState(() {
                  widget.userDetail.maritalStatus = EnumToString.fromString(
                      MaritalStatusEnum.values, val.toString());
                });
              },
            ),
            ExpandedCustomDropDownMenu(
              label: "Cinsiyet",
              index: widget.userDetail.gender!.index,
              listExtension: GenderExtension.getList(),
              onChanged: (val) {
                setState(() {
                  widget.userDetail.gender = EnumToString.fromString(
                      GenderEnum.values, val.toString());
                });
              },
            ),
          ],
        ),
        Row(
          children: [
            ExpandedCustomDropDownMenu(
              label: "Engel Derecesi",
              index: widget.userDetail.disabledDegree!.index,
              listExtension: DisabledDegreeExtension.getList(),
              onChanged: (val) {
                setState(() {
                  widget.userDetail.disabledDegree = EnumToString.fromString(
                      DisabledDegreeEnum.values, val.toString());
                });
              },
            ),
            ExpandedNameController(
              controller: tabKisiselBilgilerController.controllerNationality,
              label: "Uyruğu",
              widget: const SizedBox(),
            ),
          ],
        ),
        Row(
          children: [
            ExpandedNameController(
              controller: tabKisiselBilgilerController.controllerNumberOfKids,
              label: "Çocuk Sayısı",
              widget: const SizedBox(),
            ),
            ExpandedCustomDropDownMenu(
              label: "Askerlik Durumu",
              index: widget.userDetail.militaryStatus!.index,
              listExtension: MilitaryStatusEnumExtension.getList(),
              onChanged: (val) {
                setState(() {
                  widget.userDetail.militaryStatus = EnumToString.fromString(
                      MilitaryStatusEnum.values, val.toString());
                });
              },
            ),
          ],
        ),
        Row(
          children: [
            ExpandedCustomDropDownMenu(
              label: "Kan Grubu",
              index: widget.userDetail.bloodType!.index,
              listExtension: BloodTypeEnumExtension.getList(),
              onChanged: (val) {
                setState(() {
                  widget.userDetail.bloodType = EnumToString.fromString(
                      BloodTypeEnum.values, val.toString());
                });
              },
            ),
            ExpandedCustomDropDownMenu(
              label: "Eğitim Durumu",
              index: widget.userDetail.educationalStatus!.index,
              listExtension: EducationalStatusExtension.getList(),
              onChanged: (val) {
                setState(() {
                  widget.userDetail.educationalStatus = EnumToString.fromString(
                      EducationalStatusEnum.values, val.toString());
                });
              },
            ),
          ],
        ),
        Row(
          children: [
            ExpandedCustomDropDownMenu(
              label: "Tamamlanan En Yüksek Eğitim Seviyesi",
              index: widget.userDetail.highestEducationLevelCompleted!.index,
              listExtension: HighestEducationLevelCompletedExtension.getList(),
              onChanged: (val) {
                setState(() {
                  widget.userDetail.highestEducationLevelCompleted =
                      EnumToString.fromString(
                          HighestEducationLevelCompletedEnum.values,
                          val.toString());
                });
              },
            ),
            ExpandedNameController(
              controller: tabKisiselBilgilerController
                  .controllerLastCompletedEducationStatus,
              label: "Son Tamamlanan Eğitim Kurumu",
              widget: const SizedBox(),
            ),
          ],
        ),
      ],
    );
  }
}

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:vtys_kalite/enums/blood_type.dart';
import 'package:vtys_kalite/enums/disabled_degree.dart';
import 'package:vtys_kalite/enums/educational_status.dart';
import 'package:vtys_kalite/enums/gender.dart';
import 'package:vtys_kalite/enums/highest_education_level_completed.dart';
import 'package:vtys_kalite/enums/marial_status.dart';
import 'package:vtys_kalite/enums/military_status.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_customdatetimepicker.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_customdropdownmenu.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_name_controller.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class TabPersonalInformation extends StatefulWidget {
  TabPersonalInformation({Key? key}) : super(key: key);

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
              dateTime: tabKisiselBilgilerController.birthDate,
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
              index: tabKisiselBilgilerController.maritalStatusIndex,
              listExtension: MaritalStatusExtension.getList(),
            ),
            ExpandedCustomDropDownMenu(
              label: "Cinsiyet",
              index: tabKisiselBilgilerController.genderIndex,
              listExtension: GenderExtension.getList(),
            ),
          ],
        ),
        Row(
          children: [
            ExpandedCustomDropDownMenu(
              label: "Engel Derecesi",
              index: tabKisiselBilgilerController.disabledDegreeIndex,
              listExtension: DisabledDegreeExtension.getList(),
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
              index: tabKisiselBilgilerController.militaryStatusIndex,
              listExtension: MilitaryStatusEnumExtension.getList(),
            ),
          ],
        ),
        Row(
          children: [
            ExpandedCustomDropDownMenu(
              label: "Kan Grubu",
              index: tabKisiselBilgilerController.bloodGroupIndex,
              listExtension: BloodTypeEnumExtension.getList(),
            ),
            ExpandedCustomDropDownMenu(
              label: "Eğitim Durumu",
              index: tabKisiselBilgilerController.educationalStatusIndex,
              listExtension: EducationalStatusExtension.getList(),
            ),
          ],
        ),
        Row(
          children: [
            ExpandedCustomDropDownMenu(
              label: "Tamamlanan En Yüksek Eğitim Seviyesi",
              index: tabKisiselBilgilerController
                  .highestEducationLevelCompletedIndex,
              listExtension: HighestEducationLevelCompletedExtension.getList(),
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

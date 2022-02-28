// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:vtys_kalite/enums/blood_type.dart';
import 'package:vtys_kalite/enums/disabled_degree.dart';
import 'package:vtys_kalite/enums/educational_status.dart';
import 'package:vtys_kalite/enums/gender.dart';
import 'package:vtys_kalite/enums/highest_education_level_completed.dart';
import 'package:vtys_kalite/enums/marial_status.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_customdatetimepicker.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_customdropdownmenu.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_name_controller.dart';

class TabPersonalInformation extends StatefulWidget {
  DateTime birthDate = DateTime.now();
  TextEditingController controllerIdentificationNumber =
      TextEditingController();
  int maritalStatusIndex = 0;
  int genderIndex = 0;
  int disabilityDegreeIndex = 0;
  int bloodGroupIndex = 0;
  int highestEducationLevelCompletedIndex = 0;

  TextEditingController controllerNationality = TextEditingController();
  TextEditingController controllerCountOfChildren = TextEditingController();
  TextEditingController controllerEdicationStatus = TextEditingController();
  TextEditingController controllerLastCompletedEducationStatus =
      TextEditingController();

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
              label: "Sözleşme Bitiş Tarihi",
              dateTime: widget.birthDate,
            ),
            ExpandedNameController(
              controller: widget.controllerIdentificationNumber,
              label: "Kimlik Numarası",
              widget: const SizedBox(),
            ),
          ],
        ),
        Row(
          children: [
            ExpandedCustomDropDownMenu(
              label: "Medeni Hal",
              index: widget.maritalStatusIndex,
              listExtension: MaritalStatusExtension.getList(),
            ),
            ExpandedCustomDropDownMenu(
              label: "Medeni Hal",
              index: widget.genderIndex,
              listExtension: GenderExtension.getList(),
            ),
          ],
        ),
        Row(
          children: [
            ExpandedCustomDropDownMenu(
              label: "Engel Derecesi",
              index: widget.disabilityDegreeIndex,
              listExtension: DisabledDegreeExtension.getList(),
            ),
            ExpandedNameController(
              controller: widget.controllerNationality,
              label: "Uyruğu",
              widget: const SizedBox(),
            ),
          ],
        ),
        Row(
          children: [
            ExpandedNameController(
              controller: widget.controllerCountOfChildren,
              label: "Çocuk Sayısı",
              widget: const SizedBox(),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(),
              ),
            ),
          ],
        ),
        Row(
          children: [
            ExpandedCustomDropDownMenu(
              label: "Kan Grubu",
              index: widget.bloodGroupIndex,
              listExtension: BloodTypeExtension.getList(),
            ),
            ExpandedCustomDropDownMenu(
              label: "Eğitim Durumu",
              index: widget.bloodGroupIndex,
              listExtension: EducationalStatusExtension.getList(),
            ),
          ],
        ),
        Row(
          children: [
            ExpandedCustomDropDownMenu(
              label: "Tamamlanan En Yüksek Eğitim Seviyesi",
              index: widget.highestEducationLevelCompletedIndex,
              listExtension: HighestEducationLevelCompletedExtension.getList(),
            ),
            ExpandedNameController(
              controller: widget.controllerLastCompletedEducationStatus,
              label: "Son Tamamlanan Eğitim Kurumu",
              widget: const SizedBox(),
            ),
          ],
        ),
      ],
    );
  }
}

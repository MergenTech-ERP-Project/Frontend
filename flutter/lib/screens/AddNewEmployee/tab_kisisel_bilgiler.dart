// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/user_helper_controller.dart';
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
  UserHelperController userHelper;
  TabPersonalInformation({
    Key? key,
    required this.userHelper,
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
              onChanged: (val) {
                if (val != null) {
                  try {
                    widget.userHelper.userDetail.dateofbirth = val;
                  } catch (e) {
                    print(e.toString());
                  }
                }
              },
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
              value: widget.userHelper.userDetail.maritalStatus!.getName,
              listExtension: MaritalStatusExtension.getList(),
              onChanged: (val) {
                setState(() {
                  widget.userHelper.userDetail.employmentType =
                      MaritalStatusExtension.getEnumFromName(
                        val);
                });
              },
            ),
            ExpandedCustomDropDownMenu(
              label: "Cinsiyet",
              value: widget.userHelper.userDetail.gender.getName,
              listExtension: GenderExtension.getList(),
              onChanged: (val) {
                setState(() {
                  widget.userHelper.userDetail.gender =
                      GenderExtension.getEnumFromName(
                        val);
                });
              },
            ),
          ],
        ),
        Row(
          children: [
            ExpandedCustomDropDownMenu(
              label: "Engel Derecesi",
              value: widget.userHelper.userDetail.disabledDegree.getName,
              listExtension: DisabledDegreeExtension.getList(),
              onChanged: (val) {
                setState(() {
                  widget.userHelper.userDetail.disabledDegree =
                      GenderExtension.getEnumFromName(
                         val);
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
              value: widget.userHelper.userDetail.militaryStatus.getName,
              listExtension: MilitaryStatusEnumExtension.getList(),
              onChanged: (val) {
                setState(() {
                  widget.userHelper.userDetail.militaryStatus =
                      MilitaryStatusEnumExtension.getEnumFromName(
                         val);
                });
              },
            ),
          ],
        ),
        Row(
          children: [
            ExpandedCustomDropDownMenu(
              label: "Kan Grubu",
              value: widget.userHelper.userDetail.bloodType.getName,
              listExtension: BloodTypeEnumExtension.getList(),
              onChanged: (val) {
                setState(() {
                  widget.userHelper.userDetail.bloodType =
                      BloodTypeEnumExtension.getEnumFromName(
                         val);
                });
              },
            ),
            ExpandedCustomDropDownMenu(
              label: "Eğitim Durumu",
              value: widget.userHelper.userDetail.educationalStatus.getName,
              listExtension: EducationalStatusExtension.getList(),
              onChanged: (val) {
                setState(() {
                 widget.userHelper.userDetail.educationalStatus =
                      EducationalStatusExtension.getEnumFromName(
                         val);
                });
              },
            ),
          ],
        ),
        Row(
          children: [
            ExpandedCustomDropDownMenu(
              label: "Tamamlanan En Yüksek Eğitim Seviyesi",
              value:widget.userHelper.userDetail.highestEducationLevelCompleted.getName,
              listExtension: HighestEducationLevelCompletedExtension.getList(),
              onChanged: (val) {
                setState(() {
                  widget.userHelper.userDetail.highestEducationLevelCompleted =
                      HighestEducationLevelCompletedExtension.getEnumFromName(
                          val);
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

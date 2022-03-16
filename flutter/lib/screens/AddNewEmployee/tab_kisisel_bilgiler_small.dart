// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_dropdownitems.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/user_helper_controller.dart';
import 'package:vtys_kalite/enums/blood_type.dart';
import 'package:vtys_kalite/enums/disabled_degree.dart';
import 'package:vtys_kalite/enums/educational_status.dart';
import 'package:vtys_kalite/enums/gender.dart';
import 'package:vtys_kalite/enums/highest_education_level_completed.dart';
import 'package:vtys_kalite/enums/marial_status.dart';
import 'package:vtys_kalite/enums/military_status.dart';

import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_name_controller.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class TabPersonalInformationSmall extends StatefulWidget {
  UserHelperController userHelper;

  TabPersonalInformationSmall({
    Key? key,
    required this.userHelper,
  }) : super(key: key);

  @override
  _TabPersonalInformationSmallState createState() =>
      _TabPersonalInformationSmallState();
}

class _TabPersonalInformationSmallState
    extends State<TabPersonalInformationSmall> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 12, left: 12, bottom: 60),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomDateTimePicker(
              labelText: "Doğum Tarihi",
              onChanged: (val) {
                if (val != null) {
                  try {
                    widget.userHelper.userDetail!.dateofbirth = val;
                  } catch (e) {
                    print(e.toString());
                  }
                }
              },
            ),
            NameController(
              controller: tabKisiselBilgilerController.controllerTcNo,
              label: "Kimlik Numarası",
              widget: const SizedBox(),
            ),
            CustomDropDownMenu(
              icon: const Icon(Icons.arrow_drop_down),
              isExpandedYes: true,
              iconSize: 20,
              text: "Medeni Hal",
              valueChoose: widget.userHelper.userDetail!.maritalStatus.getName,
              list: MaritalStatusExtension.getList(),
              onChanged: (val) {
                setState(() {
                  widget.userHelper.userDetail!.employmentType =
                      MaritalStatusExtension.getEnumFromName(val);
                });
              },
            ),
            CustomDropDownMenu(
              icon: const Icon(Icons.arrow_drop_down),
              isExpandedYes: true,
              iconSize: 20,
              text: "Cinsiyet",
              valueChoose: widget.userHelper.userDetail!.gender.getName,
              list: GenderExtension.getList(),
              onChanged: (val) {
                setState(() {
                  widget.userHelper.userDetail!.gender =
                      GenderExtension.getEnumFromName(val);
                });
              },
            ),
            CustomDropDownMenu(
              icon: const Icon(Icons.arrow_drop_down),
              isExpandedYes: true,
              iconSize: 20,
              text: "Engel Derecesi",
              valueChoose: widget.userHelper.userDetail!.disabledDegree.getName,
              list: DisabledDegreeExtension.getList(),
              onChanged: (val) {
                setState(() {
                  widget.userHelper.userDetail!.disabledDegree =
                      GenderExtension.getEnumFromName(val);
                });
              },
            ),
            NameController(
              controller: tabKisiselBilgilerController.controllerNationality,
              label: "Uyruğu",
              widget: const SizedBox(),
            ),
            NameController(
              controller: tabKisiselBilgilerController.controllerNumberOfKids,
              label: "Çocuk Sayısı",
              widget: const SizedBox(),
            ),
            CustomDropDownMenu(
              icon: const Icon(Icons.arrow_drop_down),
              isExpandedYes: true,
              iconSize: 20,
              text: "Askerlik Durumu",
              valueChoose: widget.userHelper.userDetail!.militaryStatus.getName,
              list: MilitaryStatusEnumExtension.getList(),
              onChanged: (val) {
                setState(() {
                  widget.userHelper.userDetail!.militaryStatus =
                      MilitaryStatusEnumExtension.getEnumFromName(val);
                });
              },
            ),
            CustomDropDownMenu(
              icon: const Icon(Icons.arrow_drop_down),
              isExpandedYes: true,
              iconSize: 20,
              text: "Kan Grubu",
              valueChoose: widget.userHelper.userDetail!.bloodType.getName,
              list: BloodTypeEnumExtension.getList(),
              onChanged: (val) {
                setState(() {
                  widget.userHelper.userDetail!.bloodType =
                      BloodTypeEnumExtension.getEnumFromName(val);
                });
              },
            ),
            CustomDropDownMenu(
              icon: const Icon(Icons.arrow_drop_down),
              isExpandedYes: true,
              iconSize: 20,
              text: "Eğitim Durumu",
              valueChoose:
                  widget.userHelper.userDetail!.educationalStatus.getName,
              list: EducationalStatusExtension.getList(),
              onChanged: (val) {
                setState(() {
                  widget.userHelper.userDetail!.educationalStatus =
                      EducationalStatusExtension.getEnumFromName(val);
                });
              },
            ),
            CustomDropDownMenu(
              icon: const Icon(Icons.arrow_drop_down),
              isExpandedYes: true,
              iconSize: 20,
              text: "Tamamlanan En Yüksek Eğitim Seviyesi",
              valueChoose: widget.userHelper.userDetail!
                  .highestEducationLevelCompleted.getName,
              list: HighestEducationLevelCompletedExtension.getList(),
              onChanged: (val) {
                setState(() {
                  widget.userHelper.userDetail!.highestEducationLevelCompleted =
                      HighestEducationLevelCompletedExtension.getEnumFromName(
                          val);
                });
              },
            ),
            NameController(
              controller: tabKisiselBilgilerController
                  .controllerLastCompletedEducationStatus,
              label: "Son Tamamlanan Eğitim Kurumu",
              widget: const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

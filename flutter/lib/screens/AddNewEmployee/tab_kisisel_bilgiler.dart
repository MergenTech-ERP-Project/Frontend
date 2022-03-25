// ignore_for_file: avoid_print, must_be_immutable, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_dropdownitems.dart';
import 'package:vtys_kalite/enums/blood_type.dart';
import 'package:vtys_kalite/enums/disabled_degree.dart';
import 'package:vtys_kalite/enums/educational_status.dart';
import 'package:vtys_kalite/enums/gender.dart';
import 'package:vtys_kalite/enums/highest_education_level_completed.dart';
import 'package:vtys_kalite/enums/marial_status.dart';
import 'package:vtys_kalite/enums/military_status.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_name_controller.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class TabPersonalInformation extends StatefulWidget {
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomDateTimePicker(
                  borderless: true,
                  labelText: "Doğum Tarihi",
                  onChanged: (val) {
                    if (val != null) {
                      try {
                        userHelper.userDetail!.dateofbirth = val;
                      } catch (e) {
                        print(e.toString());
                      }
                    }
                  },
                ),
              ),
            ),
            Expanded(
              child: NameController(
                controller: tabKisiselBilgilerController.controllerTcNo,
                label: "Kimlik Numarası",
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
                child: Obx(
                  () => CustomDropDownMenu(
                    icon: const Icon(Icons.arrow_drop_down),
                    isExpandedYes: true,
                    iconSize: 20,
                    text: "Medeni Hal",
                    valueChoose: userHelper.userDetail!.maritalStatus.getName,
                    list: MaritalStatusExtension.getList(),
                    onChanged: (val) {
                      userHelper.userDetail!.maritalStatus =
                          MaritalStatusExtension.getEnumFromName(val);
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => CustomDropDownMenu(
                    icon: const Icon(Icons.arrow_drop_down),
                    isExpandedYes: true,
                    iconSize: 20,
                    text: "Cinsiyet",
                    valueChoose: userHelper.userDetail!.gender.getName,
                    list: GenderExtension.getList(),
                    onChanged: (val) {
                      userHelper.userDetail!.gender =
                          GenderExtension.getEnumFromName(val);
                    },
                  ),
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
                child: Obx(
                  () => CustomDropDownMenu(
                    icon: const Icon(Icons.arrow_drop_down),
                    isExpandedYes: true,
                    iconSize: 20,
                    text: "Engel Derecesi",
                    valueChoose: userHelper.userDetail!.disabledDegree.getName,
                    list: DisabledDegreeExtension.getList(),
                    onChanged: (val) {
                      userHelper.userDetail!.disabledDegree =
                          DisabledDegreeExtension.getEnumFromName(val);
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: NameController(
                controller: tabKisiselBilgilerController.controllerNationality,
                label: "Uyruğu",
                widget: const SizedBox(),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: NameController(
                controller: tabKisiselBilgilerController.controllerNumberOfKids,
                label: "Çocuk Sayısı",
                widget: const SizedBox(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => CustomDropDownMenu(
                    icon: const Icon(Icons.arrow_drop_down),
                    isExpandedYes: true,
                    iconSize: 20,
                    text: "Askerlik Durumu",
                    valueChoose: userHelper.userDetail!.militaryStatus.getName,
                    list: MilitaryStatusEnumExtension.getList(),
                    onChanged: (val) {
                      userHelper.userDetail!.militaryStatus =
                          MilitaryStatusEnumExtension.getEnumFromName(val);
                    },
                  ),
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
                child: Obx((() => CustomDropDownMenu(
                      icon: const Icon(Icons.arrow_drop_down),
                      isExpandedYes: true,
                      iconSize: 20,
                      text: "Kan Grubu",
                      valueChoose: userHelper.userDetail!.bloodType.getName,
                      list: BloodTypeEnumExtension.getList(),
                      onChanged: (val) {
                        userHelper.userDetail!.bloodType =
                            BloodTypeEnumExtension.getEnumFromName(val);
                      },
                    ))),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => CustomDropDownMenu(
                    icon: const Icon(Icons.arrow_drop_down),
                    isExpandedYes: true,
                    iconSize: 20,
                    text: "Eğitim Durumu",
                    valueChoose:
                        userHelper.userDetail!.educationalStatus.getName,
                    list: EducationalStatusExtension.getList(),
                    onChanged: (val) {
                      userHelper.userDetail!.educationalStatus =
                          EducationalStatusExtension.getEnumFromName(val);
                    },
                  ),
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
                child: Obx(
                  () => CustomDropDownMenu(
                    icon: const Icon(Icons.arrow_drop_down),
                    isExpandedYes: true,
                    iconSize: 20,
                    text: "Tamamlanan En Yüksek Eğitim Seviyesi",
                    valueChoose: userHelper
                        .userDetail!.highestEducationLevelCompleted.getName,
                    list: HighestEducationLevelCompletedExtension.getList(),
                    onChanged: (val) {
                      userHelper.userDetail!.highestEducationLevelCompleted =
                          HighestEducationLevelCompletedExtension
                              .getEnumFromName(val);
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: NameController(
                controller: tabKisiselBilgilerController
                    .controllerLastCompletedEducationStatus,
                label: "Son Tamamlanan Eğitim Kurumu",
                widget: const SizedBox(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

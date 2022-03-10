// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_name_controller.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class TabPersonalInformationSmall extends StatefulWidget {
  TabPersonalInformationSmall({Key? key}) : super(key: key);

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
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   child: ExpandedCustomDateTimePicker(
            //     label: "Sözleşme Bitiş Tarihi",
            //     dateTime: tabKisiselBilgilerController.birthDate,
            //   ),
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   child: ExpandedNameController(
            //     controller:
            //         tabKisiselBilgilerController.controllerTcNo,
            //     label: "Kimlik Numarası",
            //     widget: const SizedBox(),
            //   ),
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   child: ExpandedCustomDropDownMenu(
            //     label: "Medeni Hal",
            //     index: tabKisiselBilgilerController.maritalStatusIndex,
            //     listExtension: MaritalStatusExtension.getList(),
            //   ),
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   child: ExpandedCustomDropDownMenu(
            //     label: "Cinsiyet",
            //     index: tabKisiselBilgilerController.genderIndex,
            //     listExtension: GenderExtension.getList(),
            //   ),
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   child: ExpandedCustomDropDownMenu(
            //     label: "Engel Derecesi",
            //     index: tabKisiselBilgilerController.disabledDegreeIndex,
            //     listExtension: DisabledDegreeExtension.getList(),
            //   ),
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   child: ExpandedNameController(
            //     controller: tabKisiselBilgilerController.controllerNationality,
            //     label: "Uyruğu",
            //     widget: const SizedBox(),
            //   ),
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   child: ExpandedNameController(
            //     controller:
            //         tabKisiselBilgilerController.controllerNumberOfKids,
            //     label: "Çocuk Sayısı",
            //     widget: const SizedBox(),
            //   ),
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   child: ExpandedCustomDropDownMenu(
            //     label: "Kan Grubu",
            //     index: tabKisiselBilgilerController.bloodGroupIndex,
            //     listExtension: BloodTypeEnumExtension.getList(),
            //   ),
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   child: ExpandedCustomDropDownMenu(
            //     label: "Eğitim Durumu",
            //     index: tabKisiselBilgilerController.bloodGroupIndex,
            //     listExtension: EducationalStatusExtension.getList(),
            //   ),
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   child: ExpandedCustomDropDownMenu(
            //     label: "Tamamlanan En Yüksek Eğitim Seviyesi",
            //     index: tabKisiselBilgilerController
            //         .highestEducationLevelCompletedIndex,
            //     listExtension:
            //         HighestEducationLevelCompletedExtension.getList(),
            //   ),
            // ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ExpandedNameController(
                controller: tabKisiselBilgilerController
                    .controllerLastCompletedEducationStatus,
                label: "Son Tamamlanan Eğitim Kurumu",
                widget: const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

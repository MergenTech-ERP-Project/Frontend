// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class TabPersonalInformationSmall extends StatefulWidget {
  DateTime birthDate = DateTime.now();
  TextEditingController controllerIdentificationNumber =
      TextEditingController();
  TextEditingController controllerMaritalStatus = TextEditingController();
  TextEditingController controllerGender = TextEditingController();
  TextEditingController controllerDisabilityLevel = TextEditingController();
  TextEditingController controllerNationality = TextEditingController();
  TextEditingController controllerCountOfChildren = TextEditingController();
  TextEditingController controllerBloodGroup = TextEditingController();
  TextEditingController controllerEdicationStatus = TextEditingController();
  TextEditingController controllerHighestLevelOfEducationCompleted =
      TextEditingController();
  TextEditingController controllerLastCompletedEducationStatus =
      TextEditingController();

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
            CustomDateTimePicker(
              suffixWidget: const Icon(Icons.calendar_today_outlined),
              labelText: "Sözleşme Bitiş Tarihi",
              borderless: true,
              onChanged: (val) {
                if (val != null) {
                  print("DateTime picker : " + val);
                }
                try {
                  widget.birthDate = dateTimeFormat.parse(val!);
                } catch (e) {
                  print(e.toString());
                }
              },
            ),
            PersonalInformationCustomText(
              controller: widget.controllerIdentificationNumber,
              label: "Kimlik Numarası",
              widgetIcon: const Icon(Icons.keyboard_arrow_down),
            ),
            PersonalInformationCustomText(
              controller: widget.controllerMaritalStatus,
              label: "Medeni Hal",
              widgetIcon: const Icon(Icons.keyboard_arrow_down),
            ),
            PersonalInformationCustomText(
              controller: widget.controllerGender,
              label: "Cinsiyet",
              widgetIcon: const Icon(Icons.keyboard_arrow_down),
            ),
            PersonalInformationCustomText(
              controller: widget.controllerDisabilityLevel,
              label: "Engel Derecesi",
              widgetIcon: const Icon(Icons.keyboard_arrow_down),
            ),
            PersonalInformationCustomText(
              controller: widget.controllerNationality,
              label: "Uyruğu",
              widgetIcon: const Icon(Icons.keyboard_arrow_down),
            ),
            PersonalInformationCustomText(
              controller: widget.controllerCountOfChildren,
              label: "Çocuk Sayısı",
              widgetIcon: const Icon(Icons.keyboard_arrow_down),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(),
            ),
            PersonalInformationCustomText(
              controller: widget.controllerBloodGroup,
              label: "Kan Grubu",
              widgetIcon: const Icon(Icons.keyboard_arrow_down),
            ),
            PersonalInformationCustomText(
              controller: widget.controllerEdicationStatus,
              label: "Eğitim Durumu",
              widgetIcon: const Icon(Icons.keyboard_arrow_down),
            ),
            PersonalInformationCustomText(
              controller: widget.controllerHighestLevelOfEducationCompleted,
              label: "Tamamlanan En Yüksek Eğitim Seviyesi",
              widgetIcon: const Icon(Icons.keyboard_arrow_down),
            ),
            PersonalInformationCustomText(
              controller: widget.controllerLastCompletedEducationStatus,
              label: "Son Tamamlanan Eğitim Kurumu",
              widgetIcon: const Icon(Icons.keyboard_arrow_down),
            ),
            //const SizedBox(height: 300),
          ],
        ),
      ),
    );
  }
}

class PersonalInformationCustomText extends StatelessWidget {
  const PersonalInformationCustomText({
    Key? key,
    required this.controller,
    required this.label,
    required this.widgetIcon,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final Widget widgetIcon;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        CustomTextBox(
          borderless: true,
          controller: controller,
          label: label,
          suffixWidget: widgetIcon,
          //keyboardType: TextInputType.multiline,
          //minLines: 1, //Normal textInputField will be displayed
          //maxLines: 2, // when user presses enter it will adapt to it
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/utilities/constants.dart';

class TabPersonalInformation extends StatefulWidget {
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
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomDateTimePicker(
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
              ),
            ),
            Expanded(
              child: CustomTextBox(
                borderless: true,
                controller: widget.controllerIdentificationNumber,
                label: "Kimlik Numarası",
                suffixWidget: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextBox(
                borderless: true,
                controller: widget.controllerMaritalStatus,
                label: "Medeni Hal",
                suffixWidget: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
            Expanded(
              child: CustomTextBox(
                borderless: true,
                controller: widget.controllerGender,
                label: "Cinsiyet",
                suffixWidget: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextBox(
                borderless: true,
                controller: widget.controllerDisabilityLevel,
                label: "Engel Derecesi",
                suffixWidget: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
            Expanded(
              child: CustomTextBox(
                borderless: true,
                controller: widget.controllerNationality,
                label: "Uyruğu",
                suffixWidget: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextBox(
                borderless: true,
                controller: widget.controllerCountOfChildren,
                label: "Çocuk Sayısı",
                suffixWidget: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
            const Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextBox(
                borderless: true,
                controller: widget.controllerBloodGroup,
                label: "Kan Grubu",
                suffixWidget: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
            Expanded(
              child: CustomTextBox(
                borderless: true,
                controller: widget.controllerEdicationStatus,
                label: "Eğitim Durumu",
                suffixWidget: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextBox(
                borderless: true,
                controller: widget.controllerHighestLevelOfEducationCompleted,
                label: "Tamamlanan En Yüksek Eğitim Seviyesi",
                suffixWidget: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
            Expanded(
              child: CustomTextBox(
                borderless: true,
                controller: widget.controllerLastCompletedEducationStatus,
                label: "Son Tamamlanan Eğitim Kurumu",
                suffixWidget: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

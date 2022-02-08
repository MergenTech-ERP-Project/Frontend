import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/utilities/constants.dart';

import '../../componenets/custom_text_box.dart';

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
                child: Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: CustomDateTimePicker(
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
                    const Expanded(
                      flex: 1,
                      child: Icon(Icons.calendar_today_outlined),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: CustomTextBox(
                        borderless: true,
                        controller: widget.controllerIdentificationNumber,
                        label: "Kimlik Numarası",
                      ),
                    ),
                    const Expanded(
                          flex: 1,
                          child: Icon(Icons.keyboard_arrow_down, color: Colors.white),
                        ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: CustomTextBox(
                        borderless: true,
                        controller: widget.controllerMaritalStatus,
                        label: "Medeni Hal",
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Icon(Icons.keyboard_arrow_down),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: CustomTextBox(
                        borderless: true,
                        controller: widget.controllerGender,
                        label: "Cinsiyet",
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Icon(Icons.keyboard_arrow_down),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: CustomTextBox(
                        borderless: true,
                        controller: widget.controllerDisabilityLevel,
                        label: "Engel Derecesi",
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Icon(Icons.keyboard_arrow_down),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: CustomTextBox(
                        borderless: true,
                        controller: widget.controllerNationality,
                        label: "Uyruğu",
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Icon(Icons.keyboard_arrow_down),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: CustomTextBox(
                        borderless: true,
                        controller: widget.controllerCountOfChildren,
                        label: "Çocuk Sayısı",
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Icon(Icons.keyboard_arrow_down),
                    ),
                  ],
                ),
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
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: CustomTextBox(
                        borderless: true,
                        controller: widget.controllerBloodGroup,
                        label: "Kan Grubu",
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Icon(Icons.keyboard_arrow_down),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: CustomTextBox(
                        borderless: true,
                        controller: widget.controllerEdicationStatus,
                        label: "Eğitim Durumu",
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Icon(Icons.keyboard_arrow_down),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: CustomTextBox(
                        borderless: true,
                        controller: widget.controllerHighestLevelOfEducationCompleted,
                        label: "Tamamlanan En Yüksek Eğitim Seviyesi",
                      ),
                    ),
                    const Expanded(
                          flex: 1,
                          child: Icon(Icons.keyboard_arrow_down),
                        ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: CustomTextBox(
                        borderless: true,
                        controller: widget.controllerLastCompletedEducationStatus,
                        label: "Son Tamamlanan Eğitim Kurumu",
                      ),
                    ),
                    const Expanded(
                          flex: 1,
                          child: Icon(Icons.keyboard_arrow_down),
                        ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_custom_textbox_use.dart';
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
            Expanded(
              child: TabCustomTextBoxUse(
                controller: widget.controllerIdentificationNumber,
                label: "Kimlik Numarası",
                widgetIcon: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TabCustomTextBoxUse(
                controller: widget.controllerMaritalStatus,
                label: "Medeni Hal",
                widgetIcon: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
            Expanded(
              child: TabCustomTextBoxUse(
                controller: widget.controllerGender,
                label: "Cinsiyet",
                widgetIcon: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TabCustomTextBoxUse(
                controller: widget.controllerDisabilityLevel,
                label: "Engel Derecesi",
                widgetIcon: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
            Expanded(
              child: TabCustomTextBoxUse(
                controller: widget.controllerNationality,
                label: "Uyruğu",
                widgetIcon: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TabCustomTextBoxUse(
                controller: widget.controllerCountOfChildren,
                label: "Çocuk Sayısı",
                widgetIcon: const Icon(Icons.keyboard_arrow_down),
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
              child: TabCustomTextBoxUse(
                controller: widget.controllerBloodGroup,
                label: "Kan Grubu",
                widgetIcon: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
            Expanded(
              child: TabCustomTextBoxUse(
                controller: widget.controllerEdicationStatus,
                label: "Eğitim Durumu",
                widgetIcon: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TabCustomTextBoxUse(
                controller: widget.controllerHighestLevelOfEducationCompleted,
                label: "Tamamlanan En Yüksek Eğitim Seviyesi",
                widgetIcon: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
            Expanded(
              child: TabCustomTextBoxUse(
                controller: widget.controllerLastCompletedEducationStatus,
                label: "Son Tamamlanan Eğitim Kurumu",
                widgetIcon: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

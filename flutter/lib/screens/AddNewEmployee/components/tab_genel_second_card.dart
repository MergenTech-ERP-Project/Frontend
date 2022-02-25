import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class TabGenelSecondCard extends StatelessWidget {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerSurname = TextEditingController();
  TextEditingController controllerEPostaWork = TextEditingController();
  TextEditingController controllerEPostaPersonal = TextEditingController();
  TextEditingController controllerTelephoneWork = TextEditingController();
  TextEditingController controllerTelephonePersonal = TextEditingController();

  TextEditingController controllerAccessType = TextEditingController();
  TextEditingController controllerContractType = TextEditingController();
  TextEditingController controllerContractEndDate = TextEditingController();

  DateTime dateOfStart = DateTime.now();
  DateTime contractEndDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: aboutPersonal(),
    );
  }

  Widget aboutPersonal() {
    return Column(
      //shrinkWrap: true,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: CustomText(
            text: "Genel Bilgiler",
          ),
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextBox(
                borderless: true,
                controller: controllerName,
                label: "Ad",
                suffixWidget: const SizedBox(),
              ),
            ),
            Expanded(
              child: CustomTextBox(
                borderless: true,
                controller: controllerSurname,
                label: "Soyad",
                suffixWidget: const SizedBox(),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextBox(
                borderless: true,
                controller: controllerEPostaWork,
                label: "E-Posta (İş)",
                suffixWidget: const SizedBox(),
              ),
            ),
            Expanded(
              child: CustomTextBox(
                borderless: true,
                controller: controllerEPostaPersonal,
                label: "E-Posta (Genel)",
                suffixWidget: const SizedBox(),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextBox(
                borderless: true,
                controller: controllerTelephoneWork,
                label: "Telefon (İş)",
                suffixWidget: const SizedBox(),
              ),
            ),
            Expanded(
              child: CustomTextBox(
                borderless: true,
                controller: controllerTelephonePersonal,
                label: "Telefon (Kişisel)",
                suffixWidget: const SizedBox(),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CustomDateTimePicker(
                suffixWidget: const Icon(Icons.calendar_today_outlined),
                labelText: "İşe Başlangıç Tarihi",
                borderless: true,
                onChanged: (val) {
                  if (val != null) {
                    print("DateTime picker : " + val);
                  }
                  try {
                    dateOfStart = dateTimeFormat.parse(val!);
                  } catch (e) {
                    print(e.toString());
                  }
                },
              ),
            ),
            Expanded(
              child: CustomTextBox(
                borderless: true,
                controller: controllerAccessType,
                label: "Erişim Türü",
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
                controller: controllerContractType,
                label: "Sözleşme Türü",
                suffixWidget: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
            Expanded(
              child: CustomDateTimePicker(
                suffixWidget: const Icon(Icons.calendar_today_outlined),
                labelText: "Sözleşme Bitiş Tarihi",
                borderless: true,
                onChanged: (val) {
                  if (val != null) {
                    print("DateTime picker : " + val);
                  }
                  try {
                    contractEndDate = dateTimeFormat.parse(val!);
                  } catch (e) {
                    print(e.toString());
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

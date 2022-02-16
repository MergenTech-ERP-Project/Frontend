// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class TabGenelSecondCardSmall extends StatelessWidget {
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: CustomText(
            text: "Genel Bilgiler",
          ),
        ),
        Row(
          children: [
            generalInformation(
              controller: controllerName,
              label: "Ad",
              widget: const SizedBox(),
            ),
            generalInformation(
              controller: controllerSurname,
              label: "Soyad",
              widget: const SizedBox(),
            ),
          ],
        ),
        Row(
          children: [
            generalInformation(
              controller: controllerEPostaWork,
              label: "E-Posta (İş)",
              widget: const SizedBox(),
            ),
            generalInformation(
              controller: controllerEPostaPersonal,
              label: "E-Posta (Genel)",
              widget: const SizedBox(),
            ),
          ],
        ),
        Row(
          children: [
            generalInformation(
              controller: controllerEPostaWork,
              label: "Telefon (İş)",
              widget: const SizedBox(),
            ),
            generalInformation(
              controller: controllerEPostaPersonal,
              label: "Telefon (Kişisel)",
              widget: const SizedBox(),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
            ),
            generalInformation(
                controller: controllerAccessType,
                label: "Erişim Türü",
                widget: const Icon(Icons.keyboard_arrow_down)),
          ],
        ),
        Row(
          children: [
            generalInformation(
                controller: controllerContractType,
                label: "Sözleşme Türü",
                widget: const Icon(Icons.keyboard_arrow_down)),
            Expanded(
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
                      contractEndDate = dateTimeFormat.parse(val!);
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class generalInformation extends StatelessWidget {
  generalInformation({
    Key? key,
    required this.controller,
    required this.label,
    required this.widget,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  Widget widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextBox(
        borderless: true,
        controller: controller,
        label: label,
        suffixWidget: widget,
      ),
    );
  }
}

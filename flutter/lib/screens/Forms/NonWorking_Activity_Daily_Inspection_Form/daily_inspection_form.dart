// ignore_for_file: avoid_print

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_dropdownitems.dart';
import 'package:vtys_kalite/componenets/custom_radiolisttile.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/models/departments_enum.dart';
import 'package:vtys_kalite/screens/Forms/components/text_widget.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class DailyInspectionFormPage extends StatefulWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController departmantController = TextEditingController();
  final TextEditingController outofHoursActivityDescriptionController =
      TextEditingController();
  final TextEditingController startWorkController = TextEditingController();
  final TextEditingController endWorkController = TextEditingController();
  final TextEditingController outofWorkPlace = TextEditingController();

  DailyInspectionFormPage({Key? key}) : super(key: key);

  @override
  _DailyInspectionFormPageState createState() =>
      _DailyInspectionFormPageState();
}

class _DailyInspectionFormPageState extends State<DailyInspectionFormPage> {
  List<String> outofHoursWorkPlace = [
    "ŞİRKET İÇİ",
    "ŞİRKET DIŞI",
  ];
  int? selectedOutofHoursWorkPlace = 0;

  List<String> titlesDepartmant = [];

  DateTime outOfHoursWork = DateTime.now();

  @override
  Widget build(BuildContext context) {
    for (var departmant in DepartmentsEnum.values) {
      titlesDepartmant.add(EnumToString.convertToString(departmant));
    }

    var screenSize = MediaQuery.of(context).size;
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            height: 100,
            color: activeColor.withOpacity(.4),
            child: Center(
              child: CustomText(
                  color: whiteColor,
                  text: "Mesai Dışı Günlük İzlem Formu",
                  size: 40,
                  textAlign: TextAlign.center),
            ),
          ),
          const SizedBox(height: 30),
          textWidget(
            label: "Username",
            textEditingController: widget.usernameController,
          ),
          const CustomText(text: 'Select Departmant'),
          const SizedBox(height: 15),
          MultipleChoiceCustomDropDownItems(
            text: "Select",
            list: titlesDepartmant,
            isExpandedYes: true,
            iconSize: 30,
            icon: const Icon(Icons.arrow_drop_down),
            onChanged: (val) {},
          ),
          const SizedBox(height: 15),
          CustomDateTimePicker(
            suffixWidget: const Icon(Icons.calendar_today_outlined),
            labelText: "Mesai Dışı Çalışma Tarihi",
            borderless: true,
            onChanged: (val) {
              if (val != null) {
                print("DateTime picker : " + val);
              }
              try {
                outOfHoursWork = dateTimeFormat.parse(val!);
              } catch (e) {
                print(e.toString());
              }
            },
          ),
          textWidget(
            label: "MESAİ DIŞI ÇALIŞMA YERİ",
            textEditingController: widget.outofWorkPlace,
          ),
          const SizedBox(height: 15),
          MultipleChoiceRadioListTile(
            list: outofHoursWorkPlace,
            groupValue: selectedOutofHoursWorkPlace,
          ),
          textWidget(
            label: "Mesai Dışı Faaliyet / Açıklama",
            textEditingController:
                widget.outofHoursActivityDescriptionController,
          ),
          textWidget(
            label: "Çalışma Başlangıç Saati",
            textEditingController: widget.startWorkController,
          ),
          textWidget(
            label: "Çalışma Bitiş Saati",
            textEditingController: widget.endWorkController,
          ),
          textWidget(
            label: "Toplam Çalışma Süresi",
            textEditingController: widget.departmantController,
          ),
          const SizedBox(height: 30),
          CustomButton(
            title: "Kaydet",
            pressAction: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_radiolisttile.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/screens/Forms/components/text_widget.dart';
import 'package:vtys_kalite/screens/Forms/forms.dart';
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
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            height: ResponsiveWidget.isSmallScreen(context) ? 200 : 150,
            color: activeColor.withOpacity(.4),
            child: Center(
              child: CustomText(
                  color: whiteColor,
                  text: "Mesai Dışı Günlük İzlem Formu",
                  size: 32,
                  textAlign: TextAlign.center),
            ),
          ),
          const SizedBox(height: 30),
          TextWidget(
            label: "Kullanıcı Adı",
            textEditingController: widget.usernameController,
          ),
          const CustomText(text: 'Departman Seçin'),
          const SizedBox(height: 15),
          // MultipleChoiceCustomDropDownItems(
          //   text: "Seç",
          //   list: titlesDepartmant,
          //   isExpandedYes: true,
          //   iconSize: 30,
          //   icon: const Icon(Icons.arrow_drop_down),
          //   onChanged: (val) {},
          // ),
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
          TextWidget(
            label: "MESAİ DIŞI ÇALIŞMA YERİ",
            textEditingController: widget.outofWorkPlace,
          ),
          const SizedBox(height: 15),
          MultipleChoiceRadioListTile(
            list: outofHoursWorkPlace,
            groupValue: selectedOutofHoursWorkPlace,
          ),
          TextWidget(
            label: "Mesai Dışı Faaliyet / Açıklama",
            textEditingController:
                widget.outofHoursActivityDescriptionController,
          ),
          TextWidget(
            label: "Çalışma Başlangıç Saati",
            textEditingController: widget.startWorkController,
          ),
          TextWidget(
            label: "Çalışma Bitiş Saati",
            textEditingController: widget.endWorkController,
          ),
          TextWidget(
            label: "Toplam Çalışma Süresi",
            textEditingController: widget.departmantController,
          ),
          const SizedBox(height: 30),
          CustomButton(
            title: "Kaydet",
            pressAction: () {
              setState(() {
                Get.back();
                dailyInspectionFormInfo.formsPageOnTap = true;
              });
            },
          ),
        ],
      ),
    );
  }
}

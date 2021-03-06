// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_radiolisttile.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/componenets/custom_text_divider.dart';
import 'package:vtys_kalite/screens/Forms/components/text_widget.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class PermissionRequestFormPage extends StatefulWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController departmantController = TextEditingController();
  final TextEditingController permissionDayController = TextEditingController();

  PermissionRequestFormPage({Key? key}) : super(key: key);

  @override
  _PermissionRequestFormPageState createState() =>
      _PermissionRequestFormPageState();
}

int userTitleIndex = 0;

class _PermissionRequestFormPageState extends State<PermissionRequestFormPage> {
  List<String> permissionType = [
    "İDARİ İZİN",
    "ÜCRETSİZ MAZERET İZNİ",
    "SOSYAL İZİN",
    "YILLIK İZİN",
    "RAPOR"
  ];
  List<String> vestingDate = [
    "Erkek Personel Çocuk Doğumu (5 gün)",
    "Evlilik İzni (3 gün)"
  ];
  List<String> permissionDateTime = [
    "Çocuk / Kardeş Evlilik İzni (1 gün)",
    "Vefat İzni(1)-(3 gün)",
    "Vefat İzni(2)-(1 gün)"
  ];

  int? selectedPermissionType = 0;
  int? selectedVestingDate = 0;
  int? selectedPermissionDateTime = 0;

  List<String> titlesDepartmant = [];
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          /* Container(
            height: ResponsiveWidget.isSmallScreen(context) ? 200 : 150,
            color: activeColor.withOpacity(.4),
            child: Center(
              child: CustomText(
                  color: whiteColor,
                  text: "İzin Talep Formu",
                  size: 32,
                  textAlign: TextAlign.center),
            ),
          ),
          const SizedBox(height: 30), */
          TextWidget(
            label: "Kullanıcı Adı",
            textEditingController: widget.usernameController,
          ),
          const CustomText(text: "Departman"),
          // MultipleChoiceCustomDropDownItems(
          //   list: titlesDepartmant,
          //   isExpandedYes: true,
          //   text: 'Departmant Seçin',
          //   iconSize: 30,
          //   icon: const Icon(Icons.arrow_drop_down),
          //   onChanged: (val) {},
          // ),
          const SizedBox(height: 15),
          const CustomTextDivider(height: 40, thickness: 2, text: "İZİN TÜRÜ"),
          MultipleChoiceRadioListTile(
            list: permissionType,
            groupValue: selectedPermissionType,
          ),
          const SizedBox(height: 50),
          const CustomTextBox(
            label: "İdari İzin Nedeni",
            borderless: true,
            customFontSize: 20,
          ),
          const SizedBox(height: 10),
          const CustomTextDivider(
            height: 40,
            thickness: 2,
            text: "Yıllık izin ise, Hakediş Tarihi",
          ),
          MultipleChoiceRadioListTile(
            list: vestingDate,
            groupValue: selectedVestingDate,
          ),
          const SizedBox(height: 50),
          const CustomTextDivider(
            height: 40,
            thickness: 2,
            text: "Mevcut İzin Gün Sayısı",
          ),
          MultipleChoiceRadioListTile(
            list: permissionDateTime,
            groupValue: selectedPermissionDateTime,
          ),
          const SizedBox(height: 50),
          CustomDateTimePicker(
            suffixWidget: const Icon(Icons.calendar_today_outlined),
            labelText: "İzin Başlangıç Tarihi",
            borderless: true,
            onChanged: (val) {
              if (val != null) {
                print("DateTime picker : " + val);
              }
              try {
                startDate = dateTimeFormat.parse(val!);
              } catch (e) {
                print(e.toString());
              }
            },
          ),
          const SizedBox(height: 15),
          CustomDateTimePicker(
            suffixWidget: const Icon(Icons.calendar_today_outlined),
            labelText: "İzin Bitiş Tarihi",
            borderless: true,
            onChanged: (val) {
              if (val != null) {
                print("DateTime picker : " + val);
              }
              try {
                endDate = dateTimeFormat.parse(val!);
              } catch (e) {
                print(e.toString());
              }
            },
          ),
          const SizedBox(height: 30),
          CustomTextBox(
            borderless: true,
            label: "İzinli Gün Sayısı",
            controller: widget.permissionDayController,
          ),
          const SizedBox(height: 30),
          /*CustomButton(
            title: "Kaydet",
            pressAction: () {
              setState(() {
                permissionRequestFormInfo.formsPageOnTap = true;
                Get.back();
              });
            },
          ), */
        ],
      ),
    );
  }
}

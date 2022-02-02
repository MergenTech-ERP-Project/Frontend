import 'dart:html';
import 'dart:typed_data';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_dropdownitems.dart';
import 'package:vtys_kalite/componenets/custom_radiolisttile.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/componenets/custom_text_divider.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/departments_enum.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/utilities/constants.dart';

class PermissionRequestFormPage extends StatefulWidget {
  static String routeName = '/PermissionRequestFormPage';
  User user = Statics.instance.getUser;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController departmantController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    for (var departmant in Departments.values) {
      titlesDepartmant.add(EnumToString.convertToString(departmant));
    }
    return Center(
      child: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: screenSize.width / 4, vertical: 50),
        children: [
          const SizedBox(height: 20),
          CustomTextBox(
            borderless: true,
            title: "Username",
            hint: "Username",
            controller: widget.usernameController,
            customFontSize: 20,
          ),
          const SizedBox(height: 10),
          const Text("Department", style: kLabelStyle),
          MultipleChoiceCustomDropDownItems(
            list: titlesDepartmant,
            isExpandedYes: true,
            text: 'Select Department',
            iconSize: 20,
            icon: Icon(Icons.arrow_drop_down),
            onChanged: (val){},
          ),
          const SizedBox(height: 10),
          CustomTextDivider(
              height: 40, thickness: 2, text: "İZİN TÜRÜ", style: kLabelStyle),
          MultipleChoiceRadioListTile(
            list: permissionType,
            groupValue: selectedPermissionType,
          ),
          const SizedBox(height: 10),
          CustomTextDivider(
              height: 40,
              thickness: 2,
              text: "İdari İzin Nedeni",
              style: kLabelStyle),
          const CustomTextBox(
            borderless: true,
            customFontSize: 20,
          ),
          const SizedBox(height: 10),
          CustomTextDivider(
              height: 40,
              thickness: 2,
              text: "Yıllık izin ise, Hakediş Tarihi",
              style: kLabelStyle),
          MultipleChoiceRadioListTile(
            list: vestingDate,
            groupValue: selectedVestingDate,
          ),
          const SizedBox(height: 10),
          CustomTextDivider(
              height: 40,
              thickness: 2,
              text: "Mevcut İzin Gün Sayısı",
              style: kLabelStyle),
          MultipleChoiceRadioListTile(
            list: permissionDateTime,
            groupValue: selectedPermissionDateTime,
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              Expanded(
                  flex: 6,
                  child: CustomTextBox(title: "İzin Başlangıç Tarihi")),
              Expanded(flex: 1, child: Text("")),
              Expanded(
                  flex: 6, child: CustomTextBox(title: "İzin Bitiş Tarihi")),
            ],
          ),
          const SizedBox(height: 10),
          CustomTextDivider(
              height: 40,
              thickness: 2,
              text: "İzinli Gün Sayısı",
              style: kLabelStyle),
          const CustomTextBox(
            customFontSize: 20,
          ),
          const SizedBox(height: 30),
          CustomButton(
            title: "Kaydet",
            pressAction: () {},
          ),
        ],
      ),
    );
  }
}

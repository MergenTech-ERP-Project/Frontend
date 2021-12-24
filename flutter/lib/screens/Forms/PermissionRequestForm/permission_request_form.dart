import 'dart:html';

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_dropdownitems.dart';
import 'package:vtys_kalite/componenets/custom_radiolisttile.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/utilities/constans.dart';

class PermissionRequestFormPage extends StatefulWidget {
  static String routeName = '/PermissionRequestFormPage';

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController departmantController = TextEditingController();

  PermissionRequestFormPage({Key? key}) : super(key: key);

  @override
  _PermissionRequestFormPageState createState() =>
      _PermissionRequestFormPageState();
}

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

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("İzin Talep Formu")),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenSize.width / 4,
              vertical: 50
          ),
          child: Center(
            child: ListView(
              children: [
                CustomTextBox(
                  borderless: true,
                  title: "Username",
                  controller: widget.usernameController,
                  customFontSize: 20,
                ),
                SizedBox(height: 10),
                const MultipleChoiceCustomDropDownItems(
                  list: kDepartmansList,
                  isExpandedYes: true,
                  text: 'Select Departmant',
                  iconSize: 20,
                  icon: Icon(Icons.arrow_drop_down),
                ),
                SizedBox(height: 10),
                Text("İZİN TÜRÜ", style: kLabelStyle),
                SizedBox(height: 10),
                MultipleChoiceRadioListTile(
                  list: permissionType,
                  groupValue: selectedPermissionType,
                ),
                SizedBox(height: 10),
                CustomTextBox(
                  title: "İdari İzin Nedeni",
                  borderless: true,
                  customFontSize: 20,
                ),
                SizedBox(height: 10),
                Text("Yıllık izin ise, Hakediş Tarihi", style: kLabelStyle),
                SizedBox(height: 10),
                MultipleChoiceRadioListTile(
                  list: vestingDate,
                  groupValue: selectedVestingDate,
                ),
                SizedBox(height: 10),
                Text("Mevcut İzin Gün Sayısı", style: kLabelStyle),
                SizedBox(height: 10),
                MultipleChoiceRadioListTile(
                  list: permissionDateTime,
                  groupValue: selectedPermissionDateTime,
                ),
                SizedBox(height: 10),
                CustomTextBox(title: "İzin Başlangıç Tarihi"),
                SizedBox(height: 10),
                CustomTextBox(title: "İzin Bitiş Tarihi"),
                SizedBox(height: 10),
                CustomTextBox(
                  title: "İzinli Gün Sayısı",
                  borderless: true,
                  customFontSize: 20,
                ),
                SizedBox(height: 30),
                CustomButton(
                  title: "Kaydet",
                  pressAction: () {},
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

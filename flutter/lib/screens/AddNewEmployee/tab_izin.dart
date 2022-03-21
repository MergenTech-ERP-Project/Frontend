// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_radiolisttile.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/componenets/custom_text_divider.dart';
import 'package:vtys_kalite/models/User%20Detail/user_vacation.dart';
import 'package:vtys_kalite/utilities/style.dart';

class TabIzin extends StatelessWidget {
  UserDetailVacation vacation;
  List<String> permissionType = [
    "İDARİ İZİN",
    "ÜCRETSİZ MAZERET İZNİ",
    "SOSYAL İZİN",
    "YILLIK İZİN",
    "RAPOR"
  ];

  var selectedPermissionType = 0.obs;

  List<String> titlesDepartmant = [];
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  TabIzin({
    Key? key,
    required this.vacation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border(
                left: BorderSide(
                  color: activeColor,
                ),
              )),
          child: CustomText(
            text: vacation.sicilNo,
          ),
        ),
        MultipleChoiceRadioListTile(
          list: permissionType,
          groupValue: selectedPermissionType.value,
          onChanged: (val) {
            selectedPermissionType.value = int.parse(val.toString());
          },
        ),
      ],
    );
  }
}

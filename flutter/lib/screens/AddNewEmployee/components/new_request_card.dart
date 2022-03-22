// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_dropdownitems.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/models/User%20Detail/user_vacation.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class NewRequestCard extends StatelessWidget {
  NewRequestCard({
    Key? key,
    required this.vacation,
    required this.permissionType,
  }) : super(key: key);
  final UserDetailVacation vacation;
  List<String> permissionType;

  var selectedPermissionType = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: CustomTextBox(
            borderless: true,
            label: "Sicil No",
            controller: TextEditingController(text: vacation.sicilNo),
            readOnly: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: CustomTextBox(
            borderless: true,
            digitsOnly: true,
            label: "İzin (iş) Günü Sayısı",
            hint: vacation.workingDayNumber.toString(),
            onTextChanged: (val) {
              vacation.workingDayNumber = int.parse(val);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: CustomDateTimePicker(
            suffixWidget: const Icon(Icons.calendar_today_outlined),
            borderless: true,
            initialDate: vacation.workStartDate != ""
                ? dateTimeFormat.parse(vacation.workStartDate)
                : DateTime.now(),
            labelText: "İşe Başlangıç Tarihi",
            onChanged: (val) {
              if (val != null) {
                try {
                  vacation.workStartDate = val;
                } catch (e) {
                  debugPrint(e.toString());
                }
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Obx(
            () => CustomDropDownMenu(
              text: "Sözleşme Türü",
              list: permissionType,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 20,
              isExpandedYes: true,
              valueChoose: permissionType[selectedPermissionType.value],
              onChanged: (val) {
                selectedPermissionType.value =
                    permissionType.indexOf(val.toString());
                vacation.vacationType = selectedPermissionType.value;
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: CustomButton(
            title: "Oluştur",
            width: double.infinity,
            pressAction: () {
              userDetailVacationController.addNewUserDetailVacation(vacation);
            },
          ),
        ),
      ],
    );
  }
}

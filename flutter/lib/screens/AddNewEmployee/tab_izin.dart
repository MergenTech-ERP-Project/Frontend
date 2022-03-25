// ignore_for_file: avoid_print, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/enums/vacation_request_status.dart';
import 'package:vtys_kalite/models/User%20Detail/user_vacation.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/new_request_card.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/request_card.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class TabIzin extends StatelessWidget {
  UserDetailVacation vacation = UserDetailVacation(
    userDetailId: userHelper.userDetail?.id ?? 0,
    sicilNo: (userHelper.userDetail?.tcno ?? 0).toString(),
    vacationRequestStatus: VacationRequestStatusEnum.pendingApproval,
  );

  List<String> permissionType = [
    "İDARİ İZİN",
    "ÜCRETSİZ MAZERET İZNİ",
    "SOSYAL İZİN",
    "YILLIK İZİN",
    "RAPOR"
  ];

  final gridDelegate = const SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 250,
    childAspectRatio: 2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: gridDelegate,
        itemCount: userDetailVacationController.vacationList.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return InkWell(
              onTap: () => showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: Container(
                    color: lightColor,
                    width: MediaQuery.of(context).size.width / 2,
                    padding: const EdgeInsets.all(10),
                    child: NewRequestCard(
                      vacation: vacation,
                      permissionType: permissionType,
                    ),
                  ),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: activeColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.add,
                  color: whiteColor,
                ),
              ),
            );
          }
          return RequestCard(
            vacation: userDetailVacationController.vacationList[index - 1],
            permissionType: permissionType,
          );
        },
      ),
    );
  }
}

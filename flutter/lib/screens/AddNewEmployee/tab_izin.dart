// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/models/User%20Detail/user_vacation.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/new_request_card.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/request_card.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class TabIzin extends StatelessWidget {
  UserDetailVacation vacation;
  TabIzin({
    Key? key,
    required this.vacation,
  }) : super(key: key);

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

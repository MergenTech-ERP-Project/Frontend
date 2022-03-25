// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class VacationRequest extends StatelessWidget {
  List<String> permissionType = [
    "İDARİ İZİN",
    "ÜCRETSİZ MAZERET İZNİ",
    "SOSYAL İZİN",
    "YILLIK İZİN",
    "RAPOR"
  ];

  @override
  Widget build(BuildContext context) {
    return userDetailVacationController.vacationList.isEmpty
        ? const Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: CustomText(
                text: "Onay Bekleyen İzin Talebi Bulunmamaktadır.",
                size: 24,
              ),
            ),
          )
        : ListView.separated(
            itemCount: userDetailVacationController.vacationList.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) => Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: CustomText(
                    text: permissionType[userDetailVacationController
                        .vacationList[index].vacationType],
                    size: 24,
                    weight: FontWeight.w400,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: CustomText(
                    text: "İzin Gün Sayısı : " +
                        userDetailVacationController
                            .vacationList[index].workingDayNumber
                            .toString(),
                    size: 18,
                    weight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
  }
}

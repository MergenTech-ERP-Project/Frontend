// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/enums/vacation_request_status.dart';
import 'package:vtys_kalite/helpers/helpers.dart';
import 'package:vtys_kalite/models/User%20Detail/user_vacation.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class RequestCard extends StatelessWidget {
  UserDetailVacation? vacation;
  List<String> permissionType;
  final isFetch = false.obs;

  RequestCard({
    Key? key,
    required this.vacation,
    required this.permissionType,
  }) : super(key: key) {
    checkAnswer();
  }

  checkAnswer() async {
    isFetch(true);
    try {
      vacation = await userDetailVacationController
          .fetchUserDetailVacationByUserDetailId(vacation!.userDetailId);
    } finally {
      isFetch(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => isFetch.value
          ? Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(child: CircularProgressIndicator()),
            )
          : Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 10,
                        width: 300,
                        decoration: BoxDecoration(
                          color: vacation!.vacationRequestStatus ==
                                  VacationRequestStatusEnum.pendingApproval
                              ? yellowColor
                              : vacation!.vacationRequestStatus ==
                                      VacationRequestStatusEnum.approved
                                  ? greenColor
                                  : vacation!.vacationRequestStatus ==
                                          VacationRequestStatusEnum.unapproved
                                      ? redColor
                                      : blackColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: CustomText(
                                text: permissionType[vacation!.vacationType],
                                size: 24,
                                weight: FontWeight.w400,
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: CustomText(
                                text: "İzin Gün Sayısı : " +
                                    vacation!.workingDayNumber.toString(),
                                size: 18,
                                weight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          child: const Center(
                            child: Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                              size: 24,
                            ),
                          ),
                          onTap: () {
                            showDialogAreYouSureDelete(
                              context,
                              () async {
                                showDialogWaitingMessage(context);
                                await userDetailVacationController
                                    .deleteUserDetailCareer(vacation!.id);
                                Navigator.of(context).pop(true);
                                showDialogDoneMessage(context);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

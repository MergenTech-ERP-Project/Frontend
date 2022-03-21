// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_dropdownitems.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/enums/vacation_request_status.dart';
import 'package:vtys_kalite/helpers/helpers.dart';
import 'package:vtys_kalite/models/User%20Detail/user_vacation.dart';
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
                    child: _NewRequestCard(
                      vacation: vacation,
                      permissionType: permissionType,
                    ),
                  ),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: activeColor,
                ),
                child: Icon(
                  Icons.add,
                  color: whiteColor,
                ),
              ),
            );
          }
          return _RequestCard(
            vacation: userDetailVacationController.vacationList[index - 1],
            permissionType: permissionType,
          );
        },
      ),
    );
  }
}

class _RequestCard extends StatelessWidget {
  UserDetailVacation? vacation;
  List<String> permissionType;
  final isFetch = false.obs;

  _RequestCard({
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

class _NewRequestCard extends StatelessWidget {
  _NewRequestCard({
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

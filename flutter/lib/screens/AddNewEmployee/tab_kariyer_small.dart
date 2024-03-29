// ignore_for_file: avoid_print, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:vtys_kalite/componenets/custom_alert_dialog.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_dropdownitems.dart';
import 'package:vtys_kalite/componenets/custom_switch.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/enums/employment_type.dart';
import 'package:vtys_kalite/enums/salary_type.dart';
import 'package:vtys_kalite/models/User%20Detail/ForCareer/payment.dart';
import 'package:vtys_kalite/models/settings/branch.dart';
import 'package:vtys_kalite/models/settings/company.dart';
import 'package:vtys_kalite/models/settings/department.dart';
import 'package:vtys_kalite/models/settings/title.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/custombuttonwidget.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_name_controller.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class TabKariyerSmall extends StatefulWidget {
  List<Payment> paymentList = <Payment>[].obs;

  @override
  State<TabKariyerSmall> createState() => _TabKariyerSmallState();
}

class _TabKariyerSmallState extends State<TabKariyerSmall> {
  ScrollController scrollController = ScrollController(
    initialScrollOffset: 0,
  );

  List<String> positionHeaders = [];
  List<String> positionChildren1 = [];
  List<String> salaryHeaders = [];
  List<String> salaryChildren1 = [];

  @override
  Widget build(BuildContext context) {
    listHeaderAndBodyFunction();

    return Column(
      children: [
        Expanded(
          child: SizedBox(
            child: Column(
              children: [
                buildHeaders(
                  Icons.person,
                  "Pozisyon",
                  "+ Ekle",
                  () {
                    showDialog(
                      context: context,
                      builder: (_) => CustomAlertDialog(
                        titleWidget: const _PozisyonEkleHeader(),
                        bodyWidgetWidth: MediaQuery.of(context).size.width - 20,
                        bodyWidget: SizedBox(
                          width: MediaQuery.of(context).size.width - 20 / 1.2,
                          child: _PozisyonEklemeBody(),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                buildCols(positionHeaders, positionChildren1, Colors.white, 30),
              ],
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .35,
            child: Column(
              children: [
                buildHeaders(
                  Icons.account_balance_wallet,
                  "Maaş",
                  "+ Ekle",
                  () {
                    showDialog(
                      context: context,
                      builder: (_) => CustomAlertDialog(
                        titleWidget: const MaasEkleHeader(),
                        bodyWidget: SizedBox(
                          width: MediaQuery.of(context).size.width - 20,
                          child: _MaasEklemeBody(),
                        ),
                        bodyWidgetWidth:
                            MediaQuery.of(context).size.width / 1.5,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                buildCols(salaryHeaders, salaryChildren1, Colors.white, 30),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void listHeaderAndBodyFunction() {
    positionHeaders = [
      'Başlangıç',
      'Bitiş',
      'Çalışma Şekli',
      'Şirket',
      'Şube',
      'Departman',
      'Ünvan',
    ];

    positionChildren1 = [
      userHelper.userDetail!.startDateWork,
      userHelper.userDetail!.contractEndDate,
      EmploymentTypeEnumExtension.getList()[
              userHelper.userDetail!.employmentType.index]
          .toString(),
      userHelper.userDetailCareer!.unitCompany,
      userHelper.userDetailCareer!.unitBranch,
      userHelper.userDetailCareer!.unitDepartment,
      userHelper.userDetailCareer!.unitTitle,
    ];

    salaryHeaders = [
      'Tutar',
      'Ödeme Düzeni',
      'Ek Ödemeler',
    ];

    salaryChildren1 = [
      tabKariyerController.controllerPaymentSalary.text.toString() +
          EmploymentTypeEnumExtension.getList()[
                  userHelper.userDetail!.employmentType.index]
              .toString(),
      tabKariyerController.controllerPaymentName.text.toString(),
      'Buraya Nasıl Ekleyeceğim Bakacağım Sonra',
    ];
  }

  Widget buildCols(List<String> headers, List<String> strings, Color color,
      double cellHeight) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.separated(
        itemCount: headers.length * 2,
        itemBuilder: ((context, index) {
          return Container(
            color: color,
            height: cellHeight,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: CustomText(
                    text: index % 2 == 0
                        ? headers[index ~/ 2]
                        : strings[(index - 1) ~/ 2]),
              ),
            ),
          );
        }),
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: index % 2 == 0 ? 0 : 10,
          );
        },
      ),
    );
  }

  Widget buildHeaders(
      IconData iconData, String text, String buttonText, onClick) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Icon(iconData, size: 22),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    size: 20,
                    text: text,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomButton(
              title: buttonText,
              pressAction: onClick,
              height: 36,
            ),
          )
        ],
      ),
    );
  }
}

class _MaasEklemeBody extends StatefulWidget {
  var asgariUcretSwitch = false.obs;
  var netSwitch = false.obs;
  var agiDahilSwitch = false.obs;

  List<Payment> odemelerList = <Payment>[].obs;

  @override
  State<_MaasEklemeBody> createState() => _MaasEklemeBodyState();
}

class _MaasEklemeBodyState extends State<_MaasEklemeBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NameController(
            controller: tabKariyerController.controllerPaymentSalary,
            label: "Maaş",
            widget: const SizedBox(),
          ),
          NameController(
            controller: tabKariyerController.controllerPaymentUnit,
            label: "Birim",
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.close),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
          Obx(
            () => CustomSwitch(
              switchValue: widget.asgariUcretSwitch.value,
              text: "Asgari Ücret",
              onChanged: (bool value) {
                widget.asgariUcretSwitch.value = value;
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CustomDropDownMenu(
                  icon: const Icon(Icons.arrow_drop_down),
                  isExpandedYes: true,
                  iconSize: 20,
                  valueChoose: userHelper.userDetailPayment!.salaryType.getName,
                  text: "Maaş Tipi",
                  list: SalaryTypeExtension.getList(),
                  onChanged: (val) {
                    setState(() {
                      userHelper.userDetailPayment!.salaryType =
                          SalaryTypeExtension.getEnumFromName(val);
                    });
                  },
                ),
              ),
              Obx(
                () => CustomSwitch(
                  switchValue: widget.netSwitch.value,
                  text: "Net",
                  onChanged: (bool value) {
                    widget.netSwitch.value = value;
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Obx(
            () => CustomSwitch(
              switchValue: widget.agiDahilSwitch.value,
              text: "AGİ dahil",
              onChanged: (bool value) {
                widget.agiDahilSwitch.value = value;
              },
            ),
          ),
          const SizedBox(height: 20),
          CustomButton(
            width: 360,
            title: "Ödeme Ekle",
            rightIcon: Icons.keyboard_arrow_down,
            pressAction: () {
              showDialog(
                context: context,
                builder: (_) => CustomAlertDialog(
                  titleWidget: const CustomText(
                    text: "Ödeme Ekleme Ekranı",
                  ),
                  bodyWidget: Wrap(
                    children: [
                      CustomTextBox(
                        label: "Ödeme nedir?",
                        controller: tabKariyerController.controllerPaymentName,
                        borderless: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: CustomButton(
                          title: "Kaydet",
                          pressAction: () {
                            setState(() {
                              // print("ömer");
                              // if (tabKariyerController
                              //         .controllerPaymentName.text
                              //         .trim() ==
                              //     "") {
                              //   Get.snackbar(
                              //     "Ödeme Ekranı Boş Bırakılamaz",
                              //     "",
                              //     colorText: whiteColor,
                              //     backgroundColor: redColor,
                              //   );
                              // } else {
                              //   widget.paymentList.add(
                              //     Payment(
                              //       name: tabKariyerController
                              //           .controllerPaymentName.text,
                              //     ),
                              //   );
                              // }
                              Get.back();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  bodyWidgetWidth: MediaQuery.of(context).size.width / 2,
                ),
              );
            },
          ),
          // SizedBox(
          //   child: Obx(
          //     () => ListView.builder(
          //       shrinkWrap: true,
          //       itemBuilder: (context, index) {
          //         return PaymentCard(
          //           onPressed: () {
          //             setState(() {
          //               // widget.paymentList.removeAt(index);
          //             });
          //           },
          //           userHelperController: widget.userHelper,
          //           // newPayment: widget.paymentList[index],
          //         );
          //       },
          //       itemCount: widget.paymentList.length,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class MaasEkleHeader extends StatelessWidget {
  const MaasEkleHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomText(
          text: 'Maaş Ekle',
        ),
        Row(
          children: [
            CustomButtonWidget(
                label: "İptal",
                function: () {
                  Get.back();
                },
                iptalMi: true),
            const SizedBox(width: 15),
            CustomButtonWidget(
                label: "Kaydet",
                function: () {
                  Get.back();
                },
                iptalMi: false),
          ],
        ),
      ],
    );
  }
}

class _PozisyonEklemeBody extends StatefulWidget {
  @override
  State<_PozisyonEklemeBody> createState() => _PozisyonEklemeBodyState();
}

class _PozisyonEklemeBodyState extends State<_PozisyonEklemeBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.info),
                ),
                Flexible(
                  child: CustomText(
                      text:
                          "Şirket, çalışma şekli ve maaş güncellemeleri içeren pozisyon değişikliklerinde "
                          "şirketinizin kurallarını kontrol ediniz.\n"
                          "İleri tarihli varsayılan pozisyonlar başlandgıç tarihinden itibaren geçerli olur."),
                ),
              ],
            ),
          ),
          Obx(
            () {
              List<String> companyNames = [];
              for (Company c in companyController.companyList) {
                companyNames.add(c.companyName);
              }
              return CustomDropDownMenu(
                icon: const Icon(Icons.arrow_drop_down),
                isExpandedYes: true,
                iconSize: 20,
                text: "Şirket",
                valueChoose:
                    companyNames[tabKariyerController.unitCompanyIndex.value],
                list: companyNames,
                onChanged: (val) {
                  if (companyNames.isNotEmpty) {
                    tabKariyerController.unitCompanyIndex.value =
                        companyNames.indexOf(val!);
                    userHelper.userDetailCareer!.unitCompany = companyNames[
                        tabKariyerController.unitCompanyIndex.value];
                  }
                },
              );
            },
          ),
          Obx(
            () {
              List<String> branchNames = [];
              for (Branch b in branchController.branchList) {
                branchNames.add(b.branchName);
              }
              return CustomDropDownMenu(
                icon: const Icon(Icons.arrow_drop_down),
                isExpandedYes: true,
                iconSize: 20,
                text: "Şube",
                valueChoose: branchNames.isEmpty
                    ? ""
                    : branchNames[tabKariyerController.unitBranchIndex.value],
                list: branchNames,
                onChanged: (val) {
                  if (branchNames.isNotEmpty) {
                    tabKariyerController.unitBranchIndex.value =
                        branchNames.indexOf(val!);
                    userHelper.userDetailCareer!.unitBranch =
                        branchNames[tabKariyerController.unitBranchIndex.value];
                  }
                },
              );
            },
          ),
          Obx(
            () {
              List<String> departmantNames = [];
              for (Department d in departmentController.departmentList) {
                departmantNames.add(d.departmentName);
              }
              return CustomDropDownMenu(
                icon: const Icon(Icons.arrow_drop_down),
                isExpandedYes: true,
                iconSize: 20,
                text: "Departman",
                valueChoose: departmantNames.isEmpty
                    ? ""
                    : departmantNames[
                        tabKariyerController.unitDepartmantIndex.value],
                list: departmantNames,
                onChanged: (val) {
                  if (departmantNames.isNotEmpty) {
                    tabKariyerController.unitDepartmantIndex.value =
                        departmantNames.indexOf(val!);
                    userHelper.userDetailCareer!.unitDepartment =
                        departmantNames[
                            tabKariyerController.unitDepartmantIndex.value];
                  }
                },
              );
            },
          ),
          Obx(
            () {
              List<String> titleNames = [];
              for (Titlee t in titleController.titleList) {
                titleNames.add(t.titleName);
              }
              return CustomDropDownMenu(
                icon: const Icon(Icons.arrow_drop_down),
                isExpandedYes: true,
                iconSize: 20,
                text: "Ünvan",
                valueChoose: titleNames.isEmpty
                    ? ""
                    : titleNames[tabKariyerController.unitTitleIndex.value],
                list: titleNames,
                onChanged: (val) {
                  if (titleNames.isNotEmpty) {
                    tabKariyerController.unitTitleIndex.value =
                        titleNames.indexOf(val!);
                    userHelper.userDetailCareer!.unitTitle = titleNames[
                        tabKariyerController.unitDepartmantIndex.value];
                  }
                },
              );
            },
          ),
          NameController(
            controller: tabKariyerController.positionYoneticisi,
            label: "Yönetici",
            widget: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                tabKariyerController.positionYoneticisi.text = "";
              },
            ),
          ),
          NameController(
            controller: tabKariyerController.positionCalismaSekli,
            label: "Çalışma Şekli",
            widget: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                tabKariyerController.positionCalismaSekli.text = "";
              },
            ),
          ),
          CustomDateTimePicker(
            labelText: 'Başlangıç Tarihi',
            borderless: true,
            onChanged: (val) {
              if (val != null) {
                try {
                  userHelper.userDetail!.startDateWork = val;
                } catch (e) {
                  print(e.toString());
                }
              }
            },
          ),
          CustomDateTimePicker(
            labelText: 'Bitiş Tarihi',
            borderless: true,
            onChanged: (val) {
              if (val != null) {
                try {
                  userHelper.userDetail!.quitWorkDate = val;
                } catch (e) {
                  print(e.toString());
                }
              }
            },
          ),
        ],
      ),
    );
  }
}

class _PozisyonEkleHeader extends StatelessWidget {
  const _PozisyonEkleHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomText(text: 'Pozisyon Ekle'),
        Row(
          children: [
            CustomButtonWidget(
                label: "İptal",
                function: () {
                  Get.back();
                },
                iptalMi: true),
            const SizedBox(width: 15),
            CustomButtonWidget(
                label: "Kaydet",
                function: () {
                  Get.back();
                },
                iptalMi: false),
          ],
        ),
      ],
    );
  }
}

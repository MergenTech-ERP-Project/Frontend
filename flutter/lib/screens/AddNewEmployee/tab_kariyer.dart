// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:vtys_kalite/componenets/custom_alert_dialog.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_dropdownitems.dart';
import 'package:vtys_kalite/componenets/custom_scrollable_column.dart';
import 'package:vtys_kalite/componenets/custom_switch.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/user_helper_controller.dart';
import 'package:vtys_kalite/enums/employment_type.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/models/settings/branch.dart';
import 'package:vtys_kalite/models/settings/company.dart';
import 'package:vtys_kalite/models/settings/department.dart';
import 'package:vtys_kalite/models/settings/title.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/models/odeme.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/custombuttonwidget.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_name_controller.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class TabKariyer extends StatefulWidget {
  List<YeniOdeme> odemelerList = <YeniOdeme>[].obs;

  var asgariUcretSwitch = false.obs;
  var netSwitch = false.obs;
  var agiDahilSwitch = false.obs;

  final UserHelperController userHelper;

  TabKariyer({Key? key, required this.userHelper}) : super(key: key);

  @override
  State<TabKariyer> createState() => _TabKariyerState();
}

class _TabKariyerState extends State<TabKariyer> {
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
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 8,
        ),
        buildHeaders(
          Icons.person,
          "Pozisyon",
          "Pozisyon Ekle",
          () {
            showDialog(
              context: context,
              builder: (_) => CustomAlertDialog(
                titleWidget: const _PozisyonEkleHeader(),
                bodyWidgetWidth: screenSize.width - 20,
                bodyWidget: SizedBox(
                  width: screenSize.width - 20 / 1.2,
                  child: _PozisyonEklemeBody(
                    userHelper: widget.userHelper,
                  ),
                ),
              ),
            );
          },
        ),
        CustomScrollableColumn(
          scrollController: scrollController,
          children: [
            buildRows(positionHeaders, Colors.white, 210),
            buildRows(positionChildren1, Colors.white, 210),
          ],
        ),
        buildHeaders(
          Icons.account_balance_wallet,
          "Maaş",
          "Maaş Ekle",
          () {
            showDialog(
              context: context,
              builder: (_) => CustomAlertDialog(
                titleWidget: const MaasEkleHeader(),
                bodyWidget: SizedBox(
                  width: screenSize.width - 20,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            NameController(
                              controller: tabKariyerController.controllerSalary,
                              label: "Maaş",
                              widget: const SizedBox(),
                            ),
                            NameController(
                              controller: tabKariyerController.controllerUnit,
                              label: "Birim",
                              widget: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            )
                          ],
                        ),
                        Row(
                          children: [
                            // ExpandedCustomDropDownMenu(
                            //   value: widget.userHelper.userDetailPayment
                            //       .salaryType!.getName,
                            //   label: "Maaş Tipi",
                            //   listExtension: SalaryTypeExtension.getList(),
                            //   onChanged: (val) {
                            //     setState(() {
                            //       widget.userHelper.userDetailPayment.salaryType =
                            //           SalaryTypeExtension.getEnumFromName(val);
                            //     });
                            //   },
                            // ),

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
                                bodyWidget: Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: CustomTextBox(
                                        label: "Yapmak istediğiniz ödeme",
                                        controller: tabKariyerController
                                            .controllerPaymentScreenInSalary,
                                        borderless: true,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: CustomButton(
                                        title: "Kaydet",
                                        pressAction: () {
                                          setState(() {
                                            if (tabKariyerController
                                                    .controllerPaymentScreenInSalary
                                                    .text
                                                    .trim() ==
                                                "") {
                                              showDialog(
                                                context: context,
                                                builder: (_) =>
                                                    CustomAlertDialog(
                                                  titleWidget: const CustomText(
                                                    text:
                                                        "Ödeme Ekranı Boş Bırakılamaz",
                                                  ),
                                                  bodyWidget: const SizedBox(),
                                                  bodyWidgetWidth:
                                                      screenSize.width,
                                                ),
                                              );
                                            } else {
                                              widget.odemelerList.add(
                                                YeniOdeme(
                                                  userHelperController:
                                                      widget.userHelper,
                                                  name: tabKariyerController
                                                      .controllerPaymentScreenInSalary
                                                      .text,
                                                ),
                                              );
                                            }
                                            Get.back();
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                bodyWidgetWidth: screenSize.width / 2,
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          child: Obx(
                            () => ListView(
                              children: widget.odemelerList,
                              shrinkWrap: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bodyWidgetWidth: screenSize.width / 1.5,
              ),
            );
          },
        ),
        CustomScrollableColumn(
          scrollController: scrollController,
          children: [
            buildRows(salaryHeaders, Colors.white, 500),
            buildRows(salaryChildren1, Colors.white, 500),
          ],
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
      widget.userHelper.userDetail!.startDateWork,
      widget.userHelper.userDetail!.quitWorkDate,
      EmploymentTypeEnumExtension.getList()[
              widget.userHelper.userDetail!.employmentType.index]
          .toString(),
      widget.userHelper.userDetailCareer!.unitCompany,
      widget.userHelper.userDetailCareer!.unitBranch,
      widget.userHelper.userDetailCareer!.unitDepartment,
      widget.userHelper.userDetailCareer!.unitTitle,
    ];

    salaryHeaders = [
      'Tutar',
      'Ödeme Düzeni',
      'Ek Ödemeler',
    ];

    salaryChildren1 = [
      tabKariyerController.controllerSalary.text.toString() +
          EmploymentTypeEnumExtension.getList()[
                  widget.userHelper.userDetail!.employmentType.index]
              .toString(),
      tabKariyerController.controllerPaymentScreenInSalary.text.toString(),
      'Buraya Nasıl Ekleyeceğim Bakacağım Sonra',
    ];
  }

  Widget buildRows(List<String> strings, Color color, double cellWidth) {
    return Container(
      color: color,
      height: 60,
      width: strings.length * cellWidth,
      child: Row(
        children: strings
            .map(
              (e) => Flexible(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(e),
                  ),
                ),
              ),
            )
            .toList(),
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
            flex: ResponsiveWidget.isLargeScreen(context) ? 4 : 1,
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
  final UserHelperController userHelper;

  const _PozisyonEklemeBody({Key? key, required this.userHelper})
      : super(key: key);

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
          Row(
            children: [
              Expanded(
                child: Obx(
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
                      valueChoose: companyNames[
                          tabKariyerController.unitCompanyIndex.value],
                      list: companyNames,
                      onChanged: (val) {
                        if (companyNames.isNotEmpty) {
                          tabKariyerController.unitCompanyIndex.value =
                              companyNames.indexOf(val!);
                          widget.userHelper.userDetailCareer!.unitCompany =
                              companyNames[
                                  tabKariyerController.unitCompanyIndex.value];
                        }
                      },
                    );
                  },
                ),
              ),
              Expanded(
                child: Obx(
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
                          : branchNames[
                              tabKariyerController.unitBranchIndex.value],
                      list: branchNames,
                      onChanged: (val) {
                        if (branchNames.isNotEmpty) {
                          tabKariyerController.unitBranchIndex.value =
                              branchNames.indexOf(val!);
                          widget.userHelper.userDetailCareer!.unitBranch =
                              branchNames[
                                  tabKariyerController.unitBranchIndex.value];
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),

          /* Row(
            children: [
              Expanded(
                child: Obx(
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
                          widget.userHelper.userDetailCareer!.unitDepartment =
                              departmantNames[
                                  tabKariyerController.unitDepartmantIndex.value];
                        }
                      },
                    );
                  },
                ),
              ),
              Expanded(
                child: Obx(
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
                          widget.userHelper.userDetailCareer!.unitTitle =
                              titleNames[
                                  tabKariyerController.unitDepartmantIndex.value];
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),*/
          Row(
            children: [
              Expanded(
                child: NameController(
                  controller: tabKariyerController.positionYoneticisi,
                  label: "Yönetici",
                  widget: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      tabKariyerController.positionYoneticisi.text = "";
                    },
                  ),
                ),
              ),
              Expanded(
                child: NameController(
                  controller: tabKariyerController.positionCalismaSekli,
                  label: "Çalışma Şekli",
                  widget: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      tabKariyerController.positionCalismaSekli.text = "";
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomDateTimePicker(
                    borderless: true,
                    labelText: 'Başlangıç Tarihi',
                    onChanged: (val) {
                      if (val != null) {
                        try {
                          widget.userHelper.userDetail!.startDateWork = val;
                        } catch (e) {
                          print(e.toString());
                        }
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomDateTimePicker(
                    borderless: true,
                    labelText: 'Bitiş Tarihi',
                    onChanged: (val) {
                      if (val != null) {
                        try {
                          widget.userHelper.userDetail!.quitWorkDate = val;
                        } catch (e) {
                          print(e.toString());
                        }
                      }
                    },
                  ),
                ),
              ),
            ],
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

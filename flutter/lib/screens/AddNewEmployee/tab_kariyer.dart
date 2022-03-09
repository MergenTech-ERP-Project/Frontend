// ignore_for_file: avoid_print, must_be_immutable

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:vtys_kalite/componenets/custom_alert_dialog.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_scrollable_column.dart';
import 'package:vtys_kalite/componenets/custom_switch.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/enums/departments_enum.dart';
import 'package:vtys_kalite/enums/employment_type.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/models/settings/branch.dart';
import 'package:vtys_kalite/models/settings/company.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/models/odeme.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/custombuttonwidget.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_customdatetimepicker.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_customdropdownmenu.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_name_controller.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class TabKariyer extends StatefulWidget {
  List<String> positionHeaders = [
    'Başlangıç',
    'Bitiş',
    'Çalışma Şekli',
    'Şirket',
    'Şube',
    'Departman',
    'Ünvan',
  ];

  List<String> positionChildren1 = [
    (dateFormat.format(tabGenelController.dateOfStart)),
    (dateFormat.format(tabGenelController.contractEndDate)),
    EmploymentTypeEnumExtension.getList()[
            tabGenelController.employmentTypeIndex]
        .toString(),
    companyController
        .companyList[tabKariyerController.positionSirketIndex].companyName,
    branchController
        .branchList[tabKariyerController.positionSubeIndex].branchName,
    DepartmentsEnumExtension.getList()[
        tabKariyerController.positionDepartmanIndex],
    tabKariyerController.positionUnvan.text.toString(),
  ];

  List<String> salaryHeaders = [
    'Geçerlilik Başlangıç',
    'Tutar',
    'Ödeme Düzeni',
    'Ek Ödemeler',
  ];

  List<String> salaryChildren1 = [
    (dateFormat.format(tabKariyerController.gecerlilikBaslangic)),
    tabKariyerController.controllerSalary.text.toString() +
        EmploymentTypeEnumExtension.getList()[
                tabGenelController.employmentTypeIndex]
            .toString(),
    tabKariyerController.controllerPaymentScreenInSalary.text.toString(),
    'Buraya Nasıl Ekleyeceğim Bakacağım Sonra',
  ];

  List<YeniOdeme> odemelerList = <YeniOdeme>[].obs;

  var asgariUcretSwitch = false.obs;
  var netSwitch = false.obs;
  var agiDahilSwitch = false.obs;

  TabKariyer({Key? key}) : super(key: key);

  @override
  State<TabKariyer> createState() => _TabKariyerState();
}

class _TabKariyerState extends State<TabKariyer> {
  ScrollController scrollController = ScrollController(
    initialScrollOffset: 0,
  );

  @override
  Widget build(BuildContext context) {
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
                  child: _PozisyonEklemeBody(),
                ),
              ),
            );
          },
        ),
        CustomScrollableColumn(
          scrollController: scrollController,
          children: [
            buildRows(widget.positionHeaders, Colors.white, 200),
            buildRows(widget.positionChildren1, Colors.white, 200),
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
                            ExpandedNameController(
                              controller: tabKariyerController.controllerSalary,
                              label: "Maaş",
                              widget: const SizedBox(),
                            ),
                            ExpandedNameController(
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
                            ExpandedCustomDateTimePicker(
                              dateTime:
                                  tabKariyerController.gecerlilikBaslangic,
                              label: "Geçerlilik Başlangıç",
                            ),
                            ExpandedNameController(
                              controller: tabKariyerController.controllerUnit,
                              label: "Maaş Tipi",
                              widget: const SizedBox(),
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
            buildRows(widget.salaryHeaders, Colors.white, 350),
            buildRows(widget.salaryChildren1, Colors.white, 350),
          ],
        ),
      ],
    );
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
            CustomButtonWidget(label: "İptal", function: () {}, iptalMi: true),
            const SizedBox(width: 15),
            CustomButtonWidget(
                label: "Kaydet", function: () {}, iptalMi: false),
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
          Row(
            children: [
              Obx(
                () {
                  List<String> companyNames = [];
                  for (Company c in companyController.companyList) {
                    companyNames.add(c.companyName);
                  }
                  return ExpandedCustomDropDownMenu(
                    label: "Şirket",
                    index: tabKariyerController.positionSirketIndex,
                    listExtension: companyNames,
                  );
                },
              ),
              Obx(
                () {
                  List<String> branchNames = [];
                  for (Branch b in branchController.branchList) {
                    branchNames.add(b.branchName);
                  }
                  return ExpandedCustomDropDownMenu(
                    label: "Şube",
                    index: tabKariyerController.positionSubeIndex,
                    listExtension: branchNames,
                  );
                },
              ),
            ],
          ),
          Row(
            children: [
              // ExpandedCustomDropDownMenu(
              //   label: "Departman",
              //   index: tabKariyerController.positionDepartmanIndex,
              //   listExtension: DepartmentsEnumExtension.getList(),
              //   onChangedFunction: (val) {
              //     setState(() {
              //       widget.userDetail.employmentType = EnumToString.fromString(
              //           EmploymentTypeEnum.values, val.toString());
              //     });
              //   },
              // ),
              ExpandedNameController(
                controller: tabKariyerController.positionUnvan,
                label: "Unvan",
                widget: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    tabKariyerController.positionUnvan.text = "";
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              ExpandedNameController(
                controller: tabKariyerController.positionYoneticisi,
                label: "Yönetici",
                widget: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    tabKariyerController.positionYoneticisi.text = "";
                  },
                ),
              ),
              ExpandedNameController(
                controller: tabKariyerController.positionCalismaSekli,
                label: "Çalışma Şekli",
                widget: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    tabKariyerController.positionCalismaSekli.text = "";
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              ExpandedCustomDateTimePicker(
                dateTime: tabKariyerController.positionDateTimeBaslangic,
                label: 'Başlangıç Tarihi',
              ),
              ExpandedCustomDateTimePicker(
                dateTime: tabKariyerController.positionDateTimeBitis,
                label: 'Bitiş Tarihi',
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
            CustomButtonWidget(label: "İptal", function: () {}, iptalMi: true),
            const SizedBox(width: 15),
            CustomButtonWidget(
                label: "Kaydet", function: () {}, iptalMi: false),
          ],
        ),
      ],
    );
  }
}

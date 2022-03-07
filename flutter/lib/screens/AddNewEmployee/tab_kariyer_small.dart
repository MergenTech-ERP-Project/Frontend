// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:vtys_kalite/componenets/custom_alert_dialog.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_scrollableColumn.dart';
import 'package:vtys_kalite/componenets/custom_switch.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/models/odeme.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class TabKariyerSmall extends StatefulWidget {
  List<String> positionHeaders = [
    'Başlangıç',
    'Bitiş',
    'Çalışma Şekli',
    'Şirket',
    'Şube',
    'Departman',
    'Ünvan',
  ];

  List<String> salaryHeaders = [
    'Geçerlilik Başlangıç',
    'Tutar',
    'Ödeme Düzeni',
    'Ek Ödemeler',
  ];

  List<String> positionChildren1 = [
    '1 Aralık 2021',
    '-',
    'Tam Zamanlı',
    'mergen yazılım',
    'eskişehir teknopark',
    'yazılım geliştirme',
    '-',
  ];

  List<String> salaryChildren1 = [
    'Geçerlilik Başlangıç',
    'Tutar',
    'Ödeme Düzeni',
    'Ek Ödemeler',
  ];

  List<YeniOdeme> odemeler = <YeniOdeme>[].obs;

  TabKariyerSmall({Key? key}) : super(key: key);

  @override
  State<TabKariyerSmall> createState() => _TabKariyerSmallState();
}

class _TabKariyerSmallState extends State<TabKariyerSmall> {
  ScrollController scrollController = ScrollController(
    initialScrollOffset: 0,
  );

  bool asgariUcretSwitch = true;
  bool netSwitch = true;
  bool agiDahilSwitch = true;

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
                titleWidget: const Expanded(
                  child: CustomText(text: 'Pozisyon Ekle'),
                ),
                bodyWidgetHeight: screenSize.height - 20,
                bodyWidgetWidth: screenSize.width - 20,
                bodyWidget: SizedBox(
                  width: screenSize.width - 20 / 1.2,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Card(
                          elevation: 5,
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(Icons.info, size: 40),
                              ),
                              CustomText(
                                text:
                                    "Şirket, çalışma şekli ve maaş güncellemeleri içeren pozisyon değişikliklerinde "
                                    "şirketinizin kurallarını kontrol ediniz.\n"
                                    "İleri tarihli varsayılan pozisyonlar başlangıç tarihinden itibaren geçerli olur.",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            PozitionWidget(
                              controller: tabKariyerController.positionSirket,
                              label: "Şirket",
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
                            PozitionWidget(
                              controller: tabKariyerController.positionSube,
                              label: "Şube",
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
                          ],
                        ),
                        Column(
                          children: [
                            PozitionWidget(
                              controller: tabKariyerController.positionDepartman,
                              label: "Departman",
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
                            PozitionWidget(
                              controller:tabKariyerController. positionUnvan,
                              label: "Unvan",
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
                          ],
                        ),
                        Column(
                          children: [
                            PozitionWidget(
                              controller: tabKariyerController.positionYoneticisi,
                              label: "Yönetici",
                              widget: const Icon(Icons.keyboard_arrow_down),
                            ),
                            PozitionWidget(
                              controller: tabKariyerController.positionCalismaSekli,
                              label: "Çalışma Şekli",
                              widget: const Icon(Icons.keyboard_arrow_down),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CustomDateTimePicker(
                              suffixWidget:
                                  const Icon(Icons.calendar_today_outlined),
                              borderless: true,
                              labelText: 'Başlangıç Tarihi',
                              onChanged: (val) {
                                tabKariyerController.positionDateTimeBaslangic =
                                    dateTimeFormat.parse(val!);
                              },
                            ),
                            CustomDateTimePicker(
                              suffixWidget:
                                  const Icon(Icons.calendar_today_outlined),
                              borderless: true,
                              labelText: 'Bitiş Tarihi',
                              onChanged: (val) {
                                tabKariyerController.positionDateTimeBitis =
                                    dateTimeFormat.parse(val!);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                title: "İptal",
                                height: 50,
                                pressAction: () {
                                  Get.back();
                                },
                              ),
                            ),
                            Expanded(
                              child: CustomButton(
                                title: "Kaydet",
                                height: 50,
                                pressAction: () {
                                  Get.back();
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
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
                titleWidget: const CustomText(
                  text: 'Maaş Ekle',
                ),
                bodyWidget: SizedBox(
                  width: screenSize.width - 20,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Card(
                          elevation: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: activeColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              children: [
                                CustomTextBox(
                                  borderless: true,
                                  controller: tabKariyerController.controllerSalary,
                                  label: "Maaş",
                                  suffixWidget: const SizedBox(),
                                ),
                                CustomTextBox(
                                  borderless: true,
                                  controller: tabKariyerController.controllerUnit,
                                  label: "Birim",
                                  suffixWidget: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(Icons.close),
                                      Icon(Icons.keyboard_arrow_down),
                                    ],
                                  ),
                                ),
                                CustomSwitch(
                                  switchValue: asgariUcretSwitch,
                                  text: "Asgari Ücret",
                                  onChanged: (bool value) {
                                    setState(() {
                                      asgariUcretSwitch = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Card(
                          elevation: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: activeColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              children: [
                                CustomDateTimePicker(
                                  suffixWidget:
                                      const Icon(Icons.calendar_today_outlined),
                                  labelText: "Geçerlilik Başlangıç",
                                  borderless: true,
                                  onChanged: (val) {
                                    if (val != null) {
                                      print("DateTime picker : " + val);
                                    }
                                    try {
                                      tabKariyerController.gecerlilikBaslangic =
                                          dateTimeFormat.parse(val!);
                                    } catch (e) {
                                      print(e.toString());
                                    }
                                  },
                                ),
                                CustomTextBox(
                                  borderless: true,
                                  controller: tabKariyerController.controllerUnit,
                                  label: "Maaş Periyodu",
                                  suffixWidget:
                                      const Icon(Icons.keyboard_arrow_down),
                                ),
                                CustomSwitch(
                                  switchValue: netSwitch,
                                  text: "Net",
                                  onChanged: (bool value) {
                                    setState(() {
                                      netSwitch = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomSwitch(
                          switchValue: agiDahilSwitch,
                          text: "AGİ dahil",
                          onChanged: (bool value) {
                            setState(() {
                              agiDahilSwitch = value;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomButton(
                              width: MediaQuery.of(context).size.width / 2,
                              title: "Ödeme Ekle",
                              rightIcon: Icons.keyboard_arrow_down,
                              pressAction: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => CustomAlertDialog(
                                    titleWidget: const CustomText(
                                      text: "Ödeme Ekleme Ekranı",
                                    ),
                                    bodyWidget: Column(
                                      children: [
                                        CustomTextBox(
                                          label: "Yapmak istediğiniz ödeme",
                                          controller:
                                              tabKariyerController.controllerPaymentScreenInSalary,
                                          borderless: true,
                                        ),
                                        CustomButton(
                                          title: "Kaydet",
                                          pressAction: () {
                                            setState(() {
                                              if (tabKariyerController.controllerPaymentScreenInSalary
                                                      .text
                                                      .trim() ==
                                                  "") {
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => CustomAlertDialog(
                                                        titleWidget:
                                                            const CustomText(
                                                                text:
                                                                    "Ödeme Ekranı Boş Bırakılamaz"),
                                                        bodyWidget:
                                                            const SizedBox(),
                                                        bodyWidgetWidth:
                                                            screenSize.width));
                                              } else {
                                                widget.odemeler.add(
                                                  YeniOdeme(
                                                    name:
                                                        tabKariyerController.controllerPaymentScreenInSalary
                                                            .text,
                                                    description:
                                                        "Ömer Faruk Öztürk",
                                                    grossPrice: true,
                                                    includePayroll: false,
                                                    periot: "Aylık",
                                                    salary: "4400",
                                                    unit: "TL",
                                                  ),
                                                );
                                              }
                                              Get.back();
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    bodyWidgetWidth: screenSize.width / 2,
                                    bodyWidgetHeight: screenSize.height / 5,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        Obx(() => ListView.builder(
                              shrinkWrap: true,
                              itemCount: widget.odemeler.length,
                              itemBuilder: ((context, index) {
                                return widget.odemeler[index];
                              }),
                            )),
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                title: "İptal",
                                height: 50,
                                pressAction: () {
                                  Get.back();
                                },
                              ),
                            ),
                            Expanded(
                              child: CustomButton(
                                title: "Kaydet",
                                height: 50,
                                pressAction: () {
                                  Get.back();
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                bodyWidgetWidth: screenSize.width / 1.5,
                bodyWidgetHeight: screenSize.height / 1.5,
              ),
            );
          },
        ),
        CustomScrollableColumn(
          scrollController: scrollController,
          children: [
            buildRows(widget.salaryHeaders, Colors.white, 320),
            buildRows(widget.salaryChildren1, Colors.white, 320),
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
            flex: 1,
            child: Row(
              children: [
                Icon(iconData),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
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

class PozitionWidget extends StatelessWidget {
  const PozitionWidget({
    Key? key,
    required this.controller,
    required this.label,
    required this.widget,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return CustomTextBox(
      controller: controller,
      borderless: true,
      suffixWidget: widget,
      label: label,
    );
  }
}

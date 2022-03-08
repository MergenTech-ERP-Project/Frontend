// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:vtys_kalite/componenets/custom_alert_dialog.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_scrollable_column.dart';
import 'package:vtys_kalite/componenets/custom_switch.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/models/odeme.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/custombuttonwidget.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_customdatetimepicker.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_name_controller.dart';

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
    '2 Aralık 2009',
    '8.000 TL / Aylık',
    'Net',
    '-',
  ];

  var asgariUcretSwitch = false.obs;
  var netSwitch = false.obs;
  var agiDahilSwitch = false.obs;

  List<YeniOdeme> odemelerList = <YeniOdeme>[].obs;

  TabKariyer({Key? key}) : super(key: key);

  @override
  State<TabKariyer> createState() => _TabKariyerState();
}

class _TabKariyerState extends State<TabKariyer> {
  ScrollController scrollController = ScrollController(
    initialScrollOffset: 0,
  );

  TextEditingController positionSirket = TextEditingController();
  TextEditingController positionSube = TextEditingController();
  TextEditingController positionDepartman = TextEditingController();
  TextEditingController positionUnvan = TextEditingController();
  TextEditingController positionYoneticisi = TextEditingController();
  TextEditingController positionCalismaSekli = TextEditingController();
  TextEditingController controllerSalary = TextEditingController();
  TextEditingController controllerUnit = TextEditingController();
  TextEditingController controllerPaymentScreenInSalary =
      TextEditingController();

  DateTime positionDateTimeBaslangic = DateTime.now();
  DateTime positionDateTimeBitis = DateTime.now();
  DateTime gecerlilikBaslangic = DateTime.now();

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
                  child: _PozisyonEkleHeader(),
                ),
                bodyWidgetHeight: screenSize.height - 20,
                bodyWidgetWidth: screenSize.width - 20,
                bodyWidget: SizedBox(
                  width: screenSize.width - 20 / 1.2,
                  child: _PozisyonEklemeBody(
                      positionSirket: positionSirket,
                      positionSube: positionSube,
                      positionDepartman: positionDepartman,
                      positionUnvan: positionUnvan,
                      positionYoneticisi: positionYoneticisi,
                      positionCalismaSekli: positionCalismaSekli,
                      positionDateTimeBaslangic: positionDateTimeBaslangic,
                      positionDateTimeBitis: positionDateTimeBitis),
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
                              controller: controllerSalary,
                              label: "Maaş",
                              widget: const SizedBox(),
                            ),
                            ExpandedNameController(
                              controller: controllerUnit,
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
                              dateTime: gecerlilikBaslangic,
                              label: "Geçerlilik Başlangıç",
                            ),
                            ExpandedNameController(
                              controller: controllerUnit,
                              label: "Maaş",
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
                                        controller:
                                            controllerPaymentScreenInSalary,
                                        borderless: true,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: CustomButton(
                                        title: "Kaydet",
                                        pressAction: () {
                                          setState(() {
                                            if (controllerPaymentScreenInSalary
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
                                                  name:
                                                      controllerPaymentScreenInSalary
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

class _PozisyonEklemeBody extends StatelessWidget {
  const _PozisyonEklemeBody({
    Key? key,
    required this.positionSirket,
    required this.positionSube,
    required this.positionDepartman,
    required this.positionUnvan,
    required this.positionYoneticisi,
    required this.positionCalismaSekli,
    required this.positionDateTimeBaslangic,
    required this.positionDateTimeBitis,
  }) : super(key: key);

  final TextEditingController positionSirket;
  final TextEditingController positionSube;
  final TextEditingController positionDepartman;
  final TextEditingController positionUnvan;
  final TextEditingController positionYoneticisi;
  final TextEditingController positionCalismaSekli;
  final DateTime positionDateTimeBaslangic;
  final DateTime positionDateTimeBitis;

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
              ExpandedNameController(
                controller: positionSirket,
                label: "Şirket",
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.close),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
              ExpandedNameController(
                controller: positionSube,
                label: "Şube",
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.close),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              ExpandedNameController(
                controller: positionDepartman,
                label: "Departman",
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.close),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
              ExpandedNameController(
                controller: positionUnvan,
                label: "Unvan",
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.close),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              ExpandedNameController(
                controller: positionYoneticisi,
                label: "Yönetici",
                widget: const Icon(Icons.keyboard_arrow_down),
              ),
              ExpandedNameController(
                controller: positionCalismaSekli,
                label: "Çalışma Şekli",
                widget: const Icon(Icons.keyboard_arrow_down),
              ),
            ],
          ),
          Row(
            children: [
              ExpandedCustomDateTimePicker(
                dateTime: positionDateTimeBaslangic,
                label: 'Başlangıç Tarihi',
              ),
              ExpandedCustomDateTimePicker(
                dateTime: positionDateTimeBitis,
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

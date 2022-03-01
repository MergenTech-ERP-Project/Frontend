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
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/models/odeme.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_customdatetimepicker.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_customswitch.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_name_controller.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

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
    'Geçerlilik Başlangıç',
    'Tutar',
    'Ödeme Düzeni',
    'Ek Ödemeler',
  ];

  List<YeniOdeme> odemelerList = <YeniOdeme>[].obs;

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
                titleWidget: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        flex: 8,
                        child: CustomText(text: 'Pozisyon Ekle'),
                      ),
                      Flexible(
                        flex: 2,
                        child: Row(
                          children: [
                            _ExpandedButtonName(
                              name: "İptal",
                              function: () {},
                            ),
                            const Expanded(child: SizedBox(width: 10)),
                            _ExpandedButtonName(
                              name: "Kaydet",
                              function: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bodyWidgetHeight: screenSize.height - 20,
                bodyWidgetWidth: screenSize.width - 20,
                bodyWidget: SizedBox(
                  width: screenSize.width - 20 / 1.2,
                  child: SingleChildScrollView(
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
                                      "İleri tarihli varsayılan pozisyonlar başlandgıç tarihinden itibaren geçerli olur.",
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            _ExpandedLabelSirket(
                              positionSirket: positionSirket,
                              name: "Şirket",
                            ),
                            _ExpandedLabelSirket(
                              positionSirket: positionSirket,
                              name: "Şube",
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            _ExpandedLabelSirket(
                              positionSirket: positionSirket,
                              name: "Departman",
                            ),
                            _ExpandedLabelSirket(
                              positionSirket: positionSirket,
                              name: "Unvan",
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            ExpandedNameController(
                              controller: positionYoneticisi,
                              label: "Yönetici",
                              widget: widget,
                            ),
                            ExpandedNameController(
                              controller: positionCalismaSekli,
                              label: "Çalışma Şekli",
                              widget: widget,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomDateTimePicker(
                                suffixWidget:
                                    const Icon(Icons.calendar_today_outlined),
                                borderless: true,
                                labelText: 'Başlangıç Tarihi',
                                onChanged: (val) {
                                  positionDateTimeBaslangic =
                                      dateTimeFormat.parse(val!);
                                },
                              ),
                            ),
                            Expanded(
                              child: CustomDateTimePicker(
                                suffixWidget:
                                    const Icon(Icons.calendar_today_outlined),
                                borderless: true,
                                labelText: 'Bitiş Tarihi',
                                onChanged: (val) {
                                  positionDateTimeBitis =
                                      dateTimeFormat.parse(val!);
                                },
                              ),
                            ),
                          ],
                        ),
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
                titleWidget: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(
                        text: 'Maaş Ekle',
                      ),
                      Row(
                        children: [
                          _ExpandedButtonName(
                            name: "İptal",
                            function: () {},
                          ),
                          const SizedBox(width: 10),
                          _ExpandedButtonName(
                            name: "Kaydet",
                            function: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
                            ExpandedCustomSwitch(
                                asgariUcretSwitch: asgariUcretSwitch,
                                text: "Asgari Ücret"),
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
                              label: "Maaş Periyodu",
                              widget: const Icon(Icons.keyboard_arrow_down),
                            ),
                            ExpandedCustomSwitch(
                                asgariUcretSwitch: netSwitch, text: "Net"),
                          ],
                        ),
                        const SizedBox(height: 10),
                        CustomSwitch(
                            switchValue: agiDahilSwitch, text: "AGİ dahil"),
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
                                                YeniOdeme(),
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
                                bodyWidgetHeight: screenSize.height / 5.5,
                              ),
                            );
                          },
                        ),
                        Obx(() => ListView.builder(
                              shrinkWrap: true,
                              itemCount: widget.odemelerList.length,
                              itemBuilder: ((context, index) {
                                return widget.odemelerList[index];
                              }),
                            )),
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

class _ExpandedButtonName extends StatelessWidget {
  _ExpandedButtonName({
    Key? key,
    required this.name,
    required this.function,
  }) : super(key: key);

  final String name;
  Function() function;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomButton(
        width: 120,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: name,
        height: 30,
        pressAction: function,
      ),
    );
  }
}

class _ExpandedLabelSirket extends StatelessWidget {
  const _ExpandedLabelSirket({
    Key? key,
    required this.positionSirket,
    required this.name,
  }) : super(key: key);

  final TextEditingController positionSirket;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextBox(
        controller: positionSirket,
        borderless: true,
        suffixWidget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.close),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
        label: name,
      ),
    );
  }
}

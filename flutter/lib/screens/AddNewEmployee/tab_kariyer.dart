import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_scrollableColumn.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/utilities/constants.dart';
import 'package:vtys_kalite/utilities/custom_scroll_behaviour.dart';

class TabKariyer extends StatefulWidget {
  TabKariyer({Key? key}) : super(key: key);

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
  DateTime positionDateTimeBaslangic = DateTime.now();
  DateTime positionDateTimeBitis = DateTime.now();

  @override
  Widget build(BuildContext context) {
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
              builder: (_) => AlertDialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                title: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        flex: 8,
                        child: Text('Pozisyon Ekle', style: kLabelHeader2Style),
                      ),
                      Flexible(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                title: "İptal",
                                height: 30,
                                pressAction: () {},
                              ),
                            ),
                            const Expanded(child: SizedBox(width: 10)),
                            Expanded(
                              child: CustomButton(
                                title: "Kaydet",
                                height: 30,
                                pressAction: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                content: Builder(
                  builder: (context) {
                    var width = MediaQuery.of(context).size.width - 20;
                    return Container(
                      width: width / 1.2,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Card(
                              child: Row(
                                children: const [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Icon(Icons.info),
                                  ),
                                  Flexible(
                                    child: Text(
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
                                  child: CustomTextBox(
                                      controller: positionSirket,
                                      borderless: true,
                                      suffixWidget: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Icon(Icons.close),
                                          Icon(Icons.keyboard_arrow_down),
                                        ],
                                      ),
                                      label: "Şirket"),
                                ),
                                Expanded(
                                  child: CustomTextBox(
                                      controller: positionSube,
                                      borderless: true,
                                      suffixWidget: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Icon(Icons.close),
                                          Icon(Icons.keyboard_arrow_down),
                                        ],
                                      ),
                                      label: "Şube"),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextBox(
                                      controller: positionDepartman,
                                      borderless: true,
                                      suffixWidget: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Icon(Icons.close),
                                          Icon(Icons.keyboard_arrow_down),
                                        ],
                                      ),
                                      label: "Departman"),
                                ),
                                Expanded(
                                  child: CustomTextBox(
                                      controller: positionUnvan,
                                      borderless: true,
                                      suffixWidget: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Icon(Icons.close),
                                          Icon(Icons.keyboard_arrow_down),
                                        ],
                                      ),
                                      label: "Unvan"),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextBox(
                                      borderless: true,
                                      controller: positionYoneticisi,
                                      suffixWidget:
                                          const Icon(Icons.keyboard_arrow_down),
                                      label: "Yönetici"),
                                ),
                                Expanded(
                                  child: CustomTextBox(
                                      borderless: true,
                                      controller: positionCalismaSekli,
                                      suffixWidget:
                                          const Icon(Icons.keyboard_arrow_down),
                                      label: "Çalışma Şekli"),
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
                                        positionDateTimeBaslangic =
                                            dateTimeFormat.parse(val!);
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
                                        positionDateTimeBitis =
                                            dateTimeFormat.parse(val!);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
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
              builder: (_) => AlertDialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                title: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        flex: 8,
                        child: Text('Maaş Ekle', style: kLabelHeader2Style),
                      ),
                      Flexible(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                title: "İptal",
                                height: 30,
                                pressAction: () {},
                              ),
                            ),
                            const Expanded(child: SizedBox(width: 10)),
                            Expanded(
                              child: CustomButton(
                                title: "Kaydet",
                                height: 30,
                                pressAction: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                content: Builder(
                  builder: (context) {
                    var width = MediaQuery.of(context).size.width / 1.5;
                    return SizedBox(
                      width: width - 20,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextBox(
                                    borderless: true,
                                    controller: controllerSalary,
                                    label: "Maaş",
                                    suffixWidget: const SizedBox(),
                                  ),
                                ),
                                Expanded(
                                  child: CustomTextBox(
                                    borderless: true,
                                    controller: controllerUnit,
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
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Switch(
                                        onChanged: (bool value) {},
                                        value: true,
                                      ),
                                      const Text("Asgari Ücret",
                                          style: kLabelStyle)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
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
            child: Icon(iconData),
          ),
          Expanded(
            flex: 10,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: kLabelThinStyle2,
              ),
            ),
          ),
          Expanded(
            flex: 2,
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

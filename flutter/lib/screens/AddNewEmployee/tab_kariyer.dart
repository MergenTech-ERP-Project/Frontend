import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_scrollableColumn.dart';
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
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyCustomScrollBehavior(),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
          ),
          buildHeaders(
            Icons.person,
            "Pozisyon",
            "Pozisyon Ekle",
            () {},
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
            () {},
          ),
          CustomScrollableColumn(
            scrollController: scrollController,
            children: [
              buildRows(widget.salaryHeaders, Colors.white, 320),
              buildRows(widget.salaryChildren1, Colors.white, 320),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildRows(List<String> strings, Color color, double cellWidth) {
    return Container(
      color: color,
      height: 60,
      width: strings.length * cellWidth,
      child: Row(
        children: strings.map((e) => Flexible(
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

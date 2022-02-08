import 'package:flutter/material.dart';
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

  List<String> positionChildren1 = [
    '1 Aralık 2021',
    '-',
    'Tam Zamanlı',
    'mergen yazılım',
    'eskişehir teknopark',
    'yazılım geliştirme',
    '-',
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
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            buildHeaders(widget.positionHeaders, Colors.white),
            buildHeaders(widget.positionChildren1, Colors.white),
          ],
        ),
      ),
    );
  }

  Widget buildHeaders(List<String> strings, Color color) {
    return Container(
      color: color,
      height: 60,
      width: strings.length * 160,
      child: Row(
        children: strings
            .map<Widget>(
              (e) => Flexible(
                child: Center(
                  child: Text(e),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

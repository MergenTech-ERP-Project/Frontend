import 'package:flutter/material.dart';

class TabGenel extends StatefulWidget {
  const TabGenel({Key? key}) : super(key: key);

  /*  final List<String> _cardPicture = [
    "İşe Başlama Tarihi" ,
    "Şirket",
    "Şube",
    "Departman",
    "E-Posta (İş)",
    "İş Telefonu"
  ];   */

  @override
  _TabGenelState createState() => _TabGenelState();
}

class _TabGenelState extends State<TabGenel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("İşe Başlama Tarihi"),
              Text("2 Aralık 2009"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Şirket"),
              Text("2 Aralık 2009"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Şube"),
              Text("2 Aralık 2009"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Departman"),
              Text("2 Aralık 2009"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("E-Posta (İş)"),
              Text("2 Aralık 2009"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("İş Telefonu"),
              Text("2 Aralık 2009"),
            ],
          ),
        ],
      ),
    );
  }
}

// ctrl .

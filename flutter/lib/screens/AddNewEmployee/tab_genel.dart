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
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Card(
            child: ListView(
              children: [
                Expanded(
                  child: Card(
                    child: ListView(
                    children: [
                      Text("CE"),
                      SizedBox(height: 10),
                      Text("ömer faruk öztürk"),
                      Container(
                        color: Colors.green,
                        child: Text("Aktif Çalışan"),
                      ),
                      Divider(),
                    ],
                  ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          Text("İşe Başlama Tarihi"),
                          Text("2 Aralık 2009"),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Şirket"),
                          Text("Mergen Yazılım"),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Şube"),
                          Text("Eskişehir Teknopark"),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Departman"),
                          Text("Yazılım Geliştirme"),
                        ],
                      ),
                      Row(
                        children: [
                          Text("E-posta (iş)"),
                          Text("omerfarukozturk026@gmail.com"),
                        ],
                      ),
                      Row(
                        children: [
                          Text("İş Telefonu"),
                          Text("54"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Card(
            color: Colors.red,
            child: Text("b"),
          ),
        ),
      ],
    );
  }
}

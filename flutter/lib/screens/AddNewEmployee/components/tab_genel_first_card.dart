import 'package:flutter/material.dart';

class TabGenelFirstCard extends StatelessWidget {
  const TabGenelFirstCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Card(
        child: ListView(
          children: [
            FirstCardImageNameActive(),
            FirstCardProfileAbout(),
          ],
        ),
      ),
    );
  }

  Expanded FirstCardProfileAbout() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("İşe Başlama Tarihi"),
                  Text("2 Aralık 2009"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Şirket"),
                  Text("Mergen Yazılım"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Şube"),
                  Text("Eskişehir Teknopark"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Departman"),
                  Text("Yazılım Geliştirme"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("E-posta (iş)"),
                  Text("omerfarukozturk026@gmail.com"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("İş Telefonu"),
                  Text("54"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded FirstCardImageNameActive() {
    return Expanded(
      flex: 4,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue[200]),
                  child: const Center(
                      child: Text(
                    "ÖÖ",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text("ömer faruk öztürk"),
            Wrap(
              spacing: 10,
              children: [
                Container(
                  color: Colors.green,
                  child: Text("Aktif Çalışan"),
                ),
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}

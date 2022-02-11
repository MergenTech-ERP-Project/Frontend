import 'package:flutter/material.dart';
import 'package:vtys_kalite/utilities/constants.dart';

class TabGenelFirstCard extends StatelessWidget {
  const TabGenelFirstCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: firstCardImageNameActive(),
          ),
          Expanded(
            flex: 1,
            child: firstCardProfileAbout(),
          ),
        ],
      ),
    );
  }

  Widget firstCardProfileAbout() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("İşe Başlama Tarihi"),
                Text("2 Aralık 2009"),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Şirket"),
                Text("Mergen Yazılım"),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Şube"),
                Text("Eskişehir Teknopark"),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Departman"),
                Text("Yazılım Geliştirme"),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("E-posta (iş)"),
                Text("omerfarukozturk026@gmail.com"),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("İş Telefonu"),
                Text("54"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget firstCardImageNameActive() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.blue[200]),
              child: const Center(
                  child: Text(
                "ÖÖ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                ),
              )),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Ömer Faruk Öztürk",
            style: kLabelHeader3Style,
          ),
          const SizedBox(height: 4),
          Container(
            height: 30,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.green,
            ),
            child: Center(
              child: Wrap(
                spacing: 10,
                children: const [
                  Text(
                    "Aktif Çalışan",
                    style: kLabelAppBarThinStyle,
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

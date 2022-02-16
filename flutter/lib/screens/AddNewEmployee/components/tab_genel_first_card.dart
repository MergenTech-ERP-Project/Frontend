import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';

class TabGenelFirstCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          firstCardImageNameActive(),
          firstCardProfileAbout(),
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
                CustomText(text: "İşe Başlama Tarihi"),
                CustomText(text: "2 Aralık 2009"),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomText(text: "Şirket"),
                CustomText(text: "Mergen Yazılım"),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomText(text: "Şube"),
                CustomText(text: "Eskişehir Teknopark"),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomText(text: "Departman"),
                CustomText(text: "Yazılım Geliştirme"),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomText(text: "E-posta (iş)"),
                CustomText(text: "omerfarukozturk026@gmail.com"),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomText(text: "İş Telefonu"),
                CustomText(text: "+90 540 000 00 00"),
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
                child: CustomText(
                  text: "ÖÖ",
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const CustomText(
            text: "Ömer Faruk Öztürk",
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
                  CustomText(
                    text: "Aktif Çalışan",
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

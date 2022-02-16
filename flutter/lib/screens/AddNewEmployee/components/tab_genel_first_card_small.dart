import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/utilities/style.dart';

class TabGenelFirstCardSmall extends StatelessWidget {
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

  Widget firstCardImageNameActive() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: lightActiveColor),
              child: Center(
                child: CustomText(
                  text: "ÖÖ",
                  color: whiteColor,
                  size: 30,
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
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.green,
            ),
            child: const Center(
              child: CustomText(
                text: "Aktif Çalışan",
              ),
            ),
          ),
          const Divider(),
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
            profileAbout("İşe Başlama Tarihi", "2 Aralık 2009"),
            const SizedBox(height: 20),
            profileAbout("Şirket", "Mergen Yazılım"),
            const SizedBox(height: 20),
            profileAbout("Şube", "Eskişehir Teknopark"),
            const SizedBox(height: 20),
            profileAbout("Departman", "Yazılım Geliştirme"),
            const SizedBox(height: 20),
            profileAbout("E-posta (iş)", "iletisim@ozturkomerfaruk.com"),
            const SizedBox(height: 20),
            profileAbout("İş Telefonu", "+90 540 000 00 00"),
          ],
        ),
      ),
    );
  }

  Column profileAbout(String textConstant, String textUser) {
    return Column(
      children: [
        CustomText(text: textConstant, weight: FontWeight.w500),
        SingleChildScrollView(child: CustomText(text: textUser)),
      ],
    );
  }
}

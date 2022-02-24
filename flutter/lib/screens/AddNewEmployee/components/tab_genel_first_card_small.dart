import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_genel_first_card_image.dart';
import 'package:vtys_kalite/utilities/style.dart';

class TabGenelFirstCardSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FirstCardImage(),
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

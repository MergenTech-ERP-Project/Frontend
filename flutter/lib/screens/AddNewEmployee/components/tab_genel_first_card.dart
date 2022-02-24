import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/main.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_genel_first_card_image.dart';
import 'package:vtys_kalite/utilities/style.dart';

class TabGenelFirstCard extends StatelessWidget {
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
}

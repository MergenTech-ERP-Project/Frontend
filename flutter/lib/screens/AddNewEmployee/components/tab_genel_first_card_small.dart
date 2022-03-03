import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_genel_first_card_image.dart';

class TabGenelFirstCardSmall extends StatelessWidget {
  final User user;

  const TabGenelFirstCardSmall({
    Key? key,
    required this.user,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FirstCardImage(user: user),
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
            profileAbout("Departman", user.getDepartment()),
            const SizedBox(height: 20),
            profileAbout("E-posta (iş)", "abcdef@mergen.com"),
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

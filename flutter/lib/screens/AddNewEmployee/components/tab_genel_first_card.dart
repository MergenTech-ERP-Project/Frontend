// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_genel_first_card_image.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class TabGenelFirstCard extends StatelessWidget {
  final User user;

  const TabGenelFirstCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FirstCardImage(user: user),
            firstCardProfileAbout(),
          ],
        ),
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
            ProfileAboutRow(
              textConstant: "İşe Başlama Tarihi",
              textUser: userHelper.userDetail!.startDateWork,
            ),
            const SizedBox(height: 20),
            ProfileAboutRow(
              textConstant: "Şirket",
              textUser: userHelper.userDetailCareer!.unitCompany,
            ),
            const SizedBox(height: 20),
            ProfileAboutRow(
              textConstant: "Şube",
              textUser: userHelper.userDetailCareer!.unitBranch,
            ),
            const SizedBox(height: 20),
            ProfileAboutRow(
              textConstant: "Departman",
              textUser: userHelper.userDetailCareer!.unitDepartment,
            ),
            const SizedBox(height: 20),
            ProfileAboutRow(
              textConstant: "Ünvan",
              textUser: userHelper.userDetailCareer!.unitTitle,
            ),
            const SizedBox(height: 20),
            ProfileAboutRow(
              textConstant: "E-posta (iş)",
              textUser: tabGenelController.controllerEPostaWork.value.text,
            ),
            const SizedBox(height: 20),
            ProfileAboutRow(
              textConstant: "İş Telefonu",
              textUser: tabGenelController.controllerWorkPhone.value.text,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileAboutRow extends StatelessWidget {
  const ProfileAboutRow({
    Key? key,
    required this.textConstant,
    required this.textUser,
  }) : super(key: key);

  final String textConstant;
  final String textUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(text: textConstant, weight: FontWeight.w500),
        SingleChildScrollView(child: CustomText(text: textUser)),
      ],
    );
  }
}

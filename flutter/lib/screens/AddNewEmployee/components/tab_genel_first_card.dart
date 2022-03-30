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
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          FirstCardImage(user: user),
          firstCardProfileAbout(),
        ],
      ),
    );
  }

  Widget firstCardProfileAbout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _ProfileAboutRow(
            textConstant: "İşe Başlama Tarihi",
            textUser: userHelper.userDetail!.startDateWork,
          ),
          _ProfileAboutRow(
            textConstant: "Şirket",
            textUser: userHelper.userDetailCareer!.unitCompany,
          ),
          _ProfileAboutRow(
            textConstant: "Şube",
            textUser: userHelper.userDetailCareer!.unitBranch,
          ),
          _ProfileAboutRow(
            textConstant: "Departman",
            textUser: userHelper.userDetailCareer!.unitDepartment,
          ),
          _ProfileAboutRow(
            textConstant: "Ünvan",
            textUser: userHelper.userDetailCareer!.unitTitle,
          ),
          _ProfileAboutRow(
            textConstant: "E-posta (iş)",
            textUser: tabGenelController.controllerEPostaWork.value.text,
          ),
          _ProfileAboutRow(
            textConstant: "İş Telefonu",
            textUser: tabGenelController.controllerWorkPhone.value.text,
          ),
        ],
      ),
    );
  }
}

class _ProfileAboutRow extends StatelessWidget {
  const _ProfileAboutRow({
    Key? key,
    required this.textConstant,
    required this.textUser,
  }) : super(key: key);

  final String textConstant;
  final String textUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: textConstant, weight: FontWeight.w500),
          SingleChildScrollView(child: CustomText(text: textUser)),
        ],
      ),
    );
  }
}

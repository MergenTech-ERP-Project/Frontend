import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_genel_first_card_image.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileAboutColumn(
            textConstant: "İşe Başlama Tarihi",
            textUser: userHelper.userDetail!.startDateWork,
          ),
          const SizedBox(height: 20),
          ProfileAboutColumn(
            textConstant: "Şirket",
            textUser: userHelper.userDetailCareer!.unitCompany,
          ),
          const SizedBox(height: 20),
          ProfileAboutColumn(
            textConstant: "Şube",
            textUser: userHelper.userDetailCareer!.unitBranch,
          ),
          const SizedBox(height: 20),
          ProfileAboutColumn(
            textConstant: "Departman",
            textUser: userHelper.userDetailCareer!.unitDepartment,
          ),
          const SizedBox(height: 20),
          ProfileAboutColumn(
            textConstant: "Ünvan",
            textUser: userHelper.userDetailCareer!.unitTitle,
          ),
          const SizedBox(height: 20),
          ProfileAboutColumn(
            textConstant: "E-posta (iş)",
            textUser: tabGenelController.controllerEPostaWork.value.text,
          ),
          const SizedBox(height: 20),
          ProfileAboutColumn(
            textConstant: "İş Telefonu",
            textUser: tabGenelController.controllerWorkPhone.value.text,
          ),
        ],
      ),
    );
  }
}

class ProfileAboutColumn extends StatelessWidget {
  const ProfileAboutColumn({
    Key? key,
    required this.textConstant,
    required this.textUser,
  }) : super(key: key);

  final String textConstant;
  final String textUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(text: textConstant, weight: FontWeight.w500),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: CustomText(text: textUser)),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/utilities/constants.dart';

class AddNewCompany extends StatelessWidget {
  const AddNewCompany({
    Key? key,
    required this.controllerCompanyName,
    required this.controllerTelephone,
    required this.controllerMail,
    required this.controllerMersisNumber,
    required this.controllerSGK,
  }) : super(key: key);

  final TextEditingController controllerCompanyName;
  final TextEditingController controllerTelephone;
  final TextEditingController controllerMail;
  final TextEditingController controllerMersisNumber;
  final TextEditingController controllerSGK;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      title: Row(
        children: const [
          Icon(
            Icons.add,
            color: kTextFontColor,
            size: 24,
          ),
          SizedBox(width: 20),
          Text('Yeni Şirket Ekle', style: kLabelHeader2Style),
        ],
      ),
      content: Builder(
        builder: (context) {
          var width = MediaQuery.of(context).size.width;
          var height = MediaQuery.of(context).size.height;
          return SizedBox(
            width: width - 400,
            height: height - 200,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Divider(
                    height: 8,
                    thickness: 3,
                  ),
                  CustomTextBox(
                    controller: controllerCompanyName,
                    label: "Şirket Adı",
                  ),
                  CustomTextBox(
                    controller: controllerTelephone,
                    label: "Telefon",
                  ),
                  CustomTextBox(
                    controller: controllerMail,
                    label: "E-posta Uzantısı",
                  ),
                  CustomTextBox(
                    controller: controllerMersisNumber,
                    label: "Mersis Numarası",
                  ),
                  CustomTextBox(
                    controller: controllerSGK,
                    label: "SGK İş Yeri Numarası",
                  ),
                  CustomButton(
                    title: "Ekle",
                    pressAction: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

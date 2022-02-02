
import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/utilities/constants.dart';

class AddNewBranch extends StatelessWidget {
  const AddNewBranch({
    Key? key,
    required this.controllerBranchName,
    required this.controllerTheParentUnitToWhichItIsConnected,
    required this.controllerVacationDays,
  }) : super(key: key);

  final TextEditingController controllerBranchName;
  final TextEditingController controllerTheParentUnitToWhichItIsConnected;
  final TextEditingController controllerVacationDays;

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
          Text('Yeni Birim Ekle', style: kLabelHeader2Style),
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
                    height: 10,
                    thickness: 4,
                  ),
                  CustomTextBox(
                    label: "Birim Adı",
                    controller: controllerBranchName,
                  ),
                  CustomTextBox(
                    label: "Bağlı Olduğu Üst Birim (Opsiyonel)",
                    controller: controllerTheParentUnitToWhichItIsConnected,
                  ),
                  const Divider(
                    thickness: 3,
                    height: 20,
                  ),
                  const Text(
                    "Kurallar",
                    style: kLabelThinStyle,
                  ),
                  CustomTextBox(
                    controller: controllerVacationDays,
                    hint: "Seçiniz",
                    label: "Tatil Takvimleri",

                    ///DateTimePickerEklenmeli
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/settings/branch.dart';
import 'package:vtys_kalite/utilities/constants.dart';

class AddNewBranch extends StatefulWidget {
  const AddNewBranch({
    Key? key,
    required this.controllerBranchName,
    required this.controllerBranchUpper,
    required this.controllerVacationDays,
    required this.controllerRules,
  }) : super(key: key);

  final TextEditingController controllerBranchName;
  final TextEditingController controllerBranchUpper;
  final TextEditingController controllerVacationDays;
  final TextEditingController controllerRules;

  @override
  State<AddNewBranch> createState() => _AddNewBranchState();
}

class _AddNewBranchState extends State<AddNewBranch> {
  final _newBranchKey = GlobalKey<FormState>();

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
      content: Builder(builder: (context) {
        var width = MediaQuery.of(context).size.width;
        var height = MediaQuery.of(context).size.height;
        return SizedBox(
          width: width - 400,
          height: height - 200,
          child: SingleChildScrollView(
            child: Form(
              key: _newBranchKey,
              child: Column(
                children: [
                  const Divider(
                    height: 8,
                    thickness: 3,
                  ),
                  CustomTextBox(
                    label: "Birim Adı",
                    controller: widget.controllerBranchName,
                    validator: validator(),
                  ),
                  CustomTextBox(
                    label: "Bağlı Olduğu Üst Birim (Opsiyonel)",
                    controller: widget.controllerBranchUpper,
                    validator: validator(),
                  ),
                  const Text(
                    "Kurallar",
                    style: kLabelThinStyle,
                  ),
                  SizedBox(height: 10),
                  CustomTextBox(
                    controller: widget.controllerRules,
                  ),
                  CustomTextBox(
                    controller: widget.controllerVacationDays,
                    hint: "Seçiniz",
                    label: "Tatil Takvimleri",
                    validator: validator(),

                    ///DateTimePickerEklenmeli
                  ),
                  CustomButton(
                    title: "Ekle",
                    pressAction: () {
                      setState(() {
                        for (Branch branch
                            in Statics.instance.branchController.branchList) {
                          if (branch.branch_name ==
                              widget.controllerBranchName) {
                            showDialog(
                                context: context,
                                builder: (_) => const SimpleDialog(
                                    title: Text("Same Branch Name exists!")));
                            return;
                          }
                        }
                        var response =
                            Statics.instance.branchController.postBranch(
                          widget.controllerBranchName.text,
                          widget.controllerBranchUpper.text,
                          widget.controllerRules.text,
                          widget.controllerVacationDays.text,
                        );
                        print(response);
                        if (_newBranchKey.currentState!.validate()) {
                          Navigator.pop(context);
                          Get.snackbar(
                            "Birim Ekleme Ekranı",
                            "Birim Kaydedildi",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: kPrimaryColor,
                            padding: EdgeInsets.only(left: width / 2 - 100),
                          );
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  validator() {
    return (val) {
      if (val!.isEmpty) {
        return "Cannot Be Blank";
      } else {
        return null;
      }
    };
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_alert_dialog.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/helpers/helpers.dart';
import 'package:vtys_kalite/models/settings/company.dart';
import 'package:vtys_kalite/models/settings/title.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class AddNewTitle extends StatefulWidget {
  final TextEditingController controllerTitleName = TextEditingController();

  @override
  State<AddNewTitle> createState() => _AddNewTitleState();
}

class _AddNewTitleState extends State<AddNewTitle> {
  final _newTitleKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      title: Row(
        children: [
          Icon(
            Icons.add,
            color: blackColor,
            size: 24,
          ),
          const SizedBox(width: 20),
          const CustomText(text: "Yeni Ünvan Ekle"),
        ],
      ),
      content: Builder(
        builder: (context) {
          var width = MediaQuery.of(context).size.width;
          return SizedBox(
            width: width / 2,
            child: SingleChildScrollView(
              child: Form(
                key: _newTitleKey,
                child: Column(
                  children: [
                    const Divider(
                      height: 8,
                      thickness: 3,
                    ),
                    CustomTextBox(
                      borderless: true,
                      controller: widget.controllerTitleName,
                      label: "Ünvan Adı",
                      validator: validator(),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      title: "Ekle",
                      pressAction: () async {
                        if (_newTitleKey.currentState!.validate()) {
                          showDialogWaitingMessage(context);

                          ///company name'e göre sorgu yapılması lazım.
                          for (Titlee title in titleController.titleList) {
                            if (title.titleName ==
                                widget.controllerTitleName.text) {
                              showDialog(
                                context: context,
                                builder: (_) => CustomAlertDialog(
                                  titleWidget:
                                      widget.controllerTitleName.text != ""
                                          ? CustomText(
                                              textAlign: TextAlign.center,
                                              text: widget.controllerTitleName
                                                      .text +
                                                  " için ünvan adı zaten kayıtlı.",
                                              weight: FontWeight.bold,
                                            )
                                          : const CustomText(
                                              text: "Bilgiler boş bırakılamaz.",
                                            ),
                                  bodyWidget: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const CustomText(
                                          text:
                                              " Ünvan adını tekrar kontrol ediniz. Sistemde zaten kayıtlıdır.",
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CustomButton(
                                          title: "Tekrar Dene",
                                          pressAction: () {
                                            Get.back();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  bodyWidgetWidth:
                                      MediaQuery.of(context).size.width / 3,
                                ),
                              );

                              return;
                            }
                          }
                          await titleController.newTitle(
                            Titlee(
                              titleName: widget.controllerTitleName.text,
                            ),
                          );
                          Navigator.pop(context);
                          Get.snackbar(
                            "Şirket Ekleme Ekranı",
                            "Şirket Kaydedildi",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: successfulColor,
                            padding: EdgeInsets.only(left: width / 2 - 100),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
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

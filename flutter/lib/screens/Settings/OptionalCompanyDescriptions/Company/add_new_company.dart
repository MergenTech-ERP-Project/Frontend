// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_alert_dialog.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/helpers/helpers.dart';
import 'package:vtys_kalite/models/settings/company.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class AddNewCompany extends StatefulWidget {
  final TextEditingController controllerCompanyName = TextEditingController();
  final TextEditingController controllerCompanyPhone = TextEditingController();
  final TextEditingController controllerDomainName = TextEditingController();
  final TextEditingController controllerMersisNo = TextEditingController();
  final TextEditingController controllerSGKCompanyNo = TextEditingController();

  Company? company;

  AddNewCompany({
    Key? key,
    this.company,
  }) : super(key: key) {
    controllerCompanyName.text = company == null ? "" : company!.companyName;
    controllerCompanyPhone.text = company == null ? "" : company!.companyPhone;
    controllerDomainName.text = company == null ? "" : company!.domainName;
    controllerMersisNo.text = company == null ? "" : company!.mersisNo;
    controllerSGKCompanyNo.text = company == null ? "" : company!.sgkCompanyNo;
  }

  @override
  State<AddNewCompany> createState() => _AddNewCompanyState();
}

class _AddNewCompanyState extends State<AddNewCompany> {
  final _newCompanyKey = GlobalKey<FormState>();

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
          CustomText(
              text: widget.company == null ? "Yeni Şirket Ekle" : "Düzenle"),
        ],
      ),
      content: Builder(
        builder: (context) {
          var width = MediaQuery.of(context).size.width;
          return SizedBox(
            width: width / 2,
            child: SingleChildScrollView(
              child: Form(
                key: _newCompanyKey,
                child: Column(
                  children: [
                    const Divider(
                      height: 8,
                      thickness: 3,
                    ),
                    CustomTextBox(
                      borderless: true,
                      controller: widget.controllerCompanyName,
                      label: "Şirket Adı",
                      validator: validator(),
                    ),
                    CustomTextBox(
                      borderless: true,
                      controller: widget.controllerCompanyPhone,
                      label: "Telefon",
                      validator: validator(),
                    ),
                    CustomTextBox(
                      borderless: true,
                      controller: widget.controllerDomainName,
                      label: "E-posta Uzantısı",
                      validator: validator(),
                    ),
                    CustomTextBox(
                      borderless: true,
                      controller: widget.controllerMersisNo,
                      label: "Mersis Numarası",
                      validator: validator(),
                    ),
                    CustomTextBox(
                      borderless: true,
                      controller: widget.controllerSGKCompanyNo,
                      label: "SGK İş Yeri Numarası",
                      validator: validator(),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                        title: widget.company == null ? "Ekle" : "Düzenle",
                        pressAction: () async {
                          if (_newCompanyKey.currentState!.validate()) {
                            showDialogWaitingMessage(context);

                            ///company name'e göre sorgu yapılması lazım.
                            for (Company company
                                in companyController.companyList) {
                              if (company.companyName ==
                                  widget.controllerCompanyName.text) {
                                showDialog(
                                  context: context,
                                  builder: (_) => CustomAlertDialog(
                                    titleWidget:
                                        widget.controllerCompanyName.text != ""
                                            ? CustomText(
                                                textAlign: TextAlign.center,
                                                text: widget
                                                        .controllerCompanyName
                                                        .text +
                                                    " için şirket adı zaten kayıtlı.",
                                                weight: FontWeight.bold,
                                              )
                                            : const CustomText(
                                                text:
                                                    "Bilgiler boş bırakılamaz.",
                                              ),
                                    bodyWidget: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          const CustomText(
                                            text:
                                                " Şirket adını tekrar kontrol ediniz. Sistemde zaten kayıtlıdır.",
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
                                ).then((value) async {
                                await Future.delayed(const Duration(seconds: 1));
                                return Navigator.pop(context);
                              });
                                return;
                              }
                            }
                            widget.company == null
                                ? await companyController.newAddCompany(Company(
                                    companyName:
                                        widget.controllerCompanyName.text,
                                    companyPhone:
                                        widget.controllerCompanyPhone.text,
                                    domainName:
                                        widget.controllerDomainName.text,
                                    mersisNo: widget.controllerMersisNo.text,
                                    sgkCompanyNo:
                                        widget.controllerSGKCompanyNo.text,
                                  ))
                                : await companyController.updateCompany(
                                    widget.company!.id,
                                    Company(
                                      id: widget.company!.id,
                                      companyName:
                                          widget.controllerCompanyName.text,
                                      companyPhone:
                                          widget.controllerCompanyPhone.text,
                                      domainName:
                                          widget.controllerDomainName.text,
                                      mersisNo: widget.controllerMersisNo.text,
                                      sgkCompanyNo:
                                          widget.controllerSGKCompanyNo.text,
                                    ));
                            Navigator.pop(context);
                            Get.snackbar(
                              widget.company == null
                                  ? "Şirket Ekleme Başarıyla Yapıldı"
                                  : "Şirket Düzenleme Başarıyla Yapıldı",
                              "",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: successfulColor,
                              padding: EdgeInsets.only(left: width / 2 - 100),
                            );
                          }
                        }),
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

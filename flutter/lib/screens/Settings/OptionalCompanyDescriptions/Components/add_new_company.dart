import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/settings/company.dart';
import 'package:vtys_kalite/utilities/constants.dart';

class AddNewCompany extends StatefulWidget {
  const AddNewCompany({
    Key? key,
    required this.controllerCompanyName,
    required this.controllerCompanyPhone,
    required this.controllerDomainName,
    required this.controllerMersisNo,
    required this.controllerSGKCompanyNo,
  }) : super(key: key);

  final TextEditingController controllerCompanyName;
  final TextEditingController controllerCompanyPhone;
  final TextEditingController controllerDomainName;
  final TextEditingController controllerMersisNo;
  final TextEditingController controllerSGKCompanyNo;

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
              child: Form(
                key: _newCompanyKey,
                child: Column(
                  children: [
                    const Divider(
                      height: 8,
                      thickness: 3,
                    ),
                    CustomTextBox(
                        controller: widget.controllerCompanyName,
                        label: "Şirket Adı",
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Cannot Be Blank";
                          } else {
                            return null;
                          }
                        }),
                    CustomTextBox(
                        controller: widget.controllerCompanyPhone,
                        label: "Telefon",
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Cannot Be Blank";
                          } else {
                            return null;
                          }
                        }),
                    CustomTextBox(
                        controller: widget.controllerDomainName,
                        label: "E-posta Uzantısı",
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Cannot Be Blank";
                          } else {
                            return null;
                          }
                        }),
                    CustomTextBox(
                        controller: widget.controllerMersisNo,
                        label: "Mersis Numarası",
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Cannot Be Blank";
                          } else {
                            return null;
                          }
                        }),
                    CustomTextBox(
                        controller: widget.controllerSGKCompanyNo,
                        label: "SGK İş Yeri Numarası",
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Cannot Be Blank";
                          } else {
                            return null;
                          }
                        }),
                    CustomButton(
                      title: "Ekle",
                      pressAction: () {
                        setState(() {
                          for (Company company in Statics
                              .instance.companyController.companyList) {
                            if (company.company_name ==
                                widget.controllerCompanyName) {
                              showDialog(
                                  context: context,
                                  builder: (_) => const SimpleDialog(
                                      title: Text("Same Company Name exists!")));
                              return;
                            }
                          }
                          var response =
                              Statics.instance.companyController.postCompany(
                            widget.controllerCompanyName.text,
                            widget.controllerCompanyPhone.text,
                            widget.controllerDomainName.text,
                            widget.controllerMersisNo.text,
                            widget.controllerSGKCompanyNo.text,
                          );
                          print(response);
                          if (_newCompanyKey.currentState!.validate()) {
                            Navigator.pop(context);
                            Get.snackbar(
                              "Şirket Ekleme Ekranı",
                              "Şirket Kaydedildi",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: kPrimaryColor,
                              padding: EdgeInsets.only(left: width/2 - 100),
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
        },
      ),
    );
  }
}

// ignore_for_file: avoid_print, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_alert_dialog.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/helpers/helpers.dart';
import 'package:vtys_kalite/models/settings/department.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class AddNewDepartmant extends StatefulWidget {
  final TextEditingController controllerDepartmantName =
      TextEditingController();

  Department? department;

  AddNewDepartmant({
    Key? key,
    this.department,
  }) : super(key: key) {
    controllerDepartmantName.text =
        department == null ? "" : department!.departmentName;
  }

  @override
  State<AddNewDepartmant> createState() => _AddNewDepartmantState();
}

class _AddNewDepartmantState extends State<AddNewDepartmant> {
  final _newDepartmantKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      title: Row(
        children: [
          Icon(
            widget.department == null ? Icons.add : Icons.edit,
            color: blackColor,
            size: 24,
          ),
          const SizedBox(width: 20),
          CustomText(
              text: widget.department == null
                  ? "Yeni Departman Ekle"
                  : "Düzenle"),
        ],
      ),
      content: Builder(
        builder: (context) {
          var width = MediaQuery.of(context).size.width;
          return SizedBox(
            width: width / 2,
            child: SingleChildScrollView(
              child: Form(
                key: _newDepartmantKey,
                child: Column(
                  children: [
                    const Divider(
                      height: 8,
                      thickness: 3,
                    ),
                    CustomTextBox(
                      borderless: true,
                      controller: widget.controllerDepartmantName,
                      label: "Departman Adı",
                      validator: validator(),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      title: widget.department == null ? "Ekle" : "Düzenle",
                      pressAction: () async {
                        if (_newDepartmantKey.currentState!.validate()) {
                          showDialogWaitingMessage(context);

                          ///company name'e göre sorgu yapılması lazım.
                          for (Department department
                              in departmentController.departmentList) {
                            if (department.departmentName ==
                                widget.controllerDepartmantName.text) {
                              showDialog(
                                context: context,
                                builder: (_) => CustomAlertDialog(
                                  titleWidget:
                                      widget.controllerDepartmantName.text != ""
                                          ? CustomText(
                                              textAlign: TextAlign.center,
                                              text: widget
                                                      .controllerDepartmantName
                                                      .text +
                                                  " için departman zaten kayıtlı.",
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
                                              " Departman adını tekrar kontrol ediniz. Sistemde zaten kayıtlıdır.",
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
                                await Future.delayed(
                                    const Duration(seconds: 1));
                                return Navigator.pop(context);
                              });

                              return;
                            }
                          }
                          widget.department == null
                              ? await departmentController.newDepartment(
                                  Department(
                                    branchId: optionalCompanyController
                                        .branchId.value,
                                    departmentName:
                                        widget.controllerDepartmantName.text,
                                  ),
                                )
                              : await departmentController.updateDepartment(
                                  widget.department!.id,
                                  Department(
                                    id: widget.department!.id,
                                    branchId: optionalCompanyController
                                        .branchId.value,
                                    departmentName:
                                        widget.controllerDepartmantName.text,
                                  ),
                                );
                          Navigator.pop(context);
                          Get.snackbar(
                            widget.department == null
                                ? "Departman Ekleme Başarıyla Yapıldı"
                                : "Ünvan Düzenleme Başarıyla Yapıldı",
                            "",
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

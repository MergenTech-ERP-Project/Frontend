// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:vtys_kalite/componenets/custom_right_icon_button.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/models/settings/company.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class OptionalCompanySirket extends StatefulWidget {
  const OptionalCompanySirket({
    Key? key,
    required this.companyList,
    required this.onCompanySelected,
  }) : super(key: key);

  final List<Company> companyList;
  final Function() onCompanySelected;

  @override
  _OptionalCompanySirketState createState() => _OptionalCompanySirketState();
}

class _OptionalCompanySirketState extends State<OptionalCompanySirket> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextBox(
          borderless: true,
          hint: "Şirket adı giriniz",
          decorationIcon: const Icon(Icons.search),
          fillcolor: Colors.white60,
        ),
        Obx(() {
          print(widget.companyList);
          return (companyController.isLoading.value
              ? const Center(
                  child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.companyList.length + 1,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: index == 0 ? null : widget.onCompanySelected,
                      child: SizedBox(
                        height: 61,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Center(
                                  child: Text(index == 0
                                      ? "Şirket Adı"
                                      : widget.companyList[index - 1]
                                          .company_name)),
                            ),
                            Expanded(
                              flex: 2,
                              child: Center(
                                  child: Text(
                                      index == 0 ? "Çalışan Sayısı" : "0")),
                            ),
                            index == 0
                                ? Row(
                                    children: [
                                      RightIconButton(
                                        icon:
                                            Icon(Icons.edit, color: whiteColor),
                                        function: () {},
                                      ),
                                      RightIconButton(
                                        icon: Icon(Icons.delete,
                                            color: whiteColor),
                                        function: () {},
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      RightIconButton(
                                        icon:
                                            Icon(Icons.edit, color: darkColor),
                                        function: () {},
                                      ),
                                      RightIconButton(
                                        icon:
                                            Icon(Icons.delete, color: redColor),
                                        function: () {},
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    );
                  },
                ));
        }),
      ],
    );
  }
}

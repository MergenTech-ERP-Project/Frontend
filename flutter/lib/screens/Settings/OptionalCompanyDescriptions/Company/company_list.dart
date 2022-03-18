// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:vtys_kalite/componenets/custom_right_icon_button.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/helpers/helpers.dart';
import 'package:vtys_kalite/models/settings/company.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Company/add_new_company.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class CompanyList extends StatefulWidget {
  const CompanyList({
    Key? key,
    required this.companyList,
    required this.onSelected,
  }) : super(key: key);

  final List<Company> companyList;
  final Function() onSelected;

  @override
  _CompanyListState createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextBox(
          borderless: true,
          hint: "Şirket adı giriniz",
          decorationIcon: Icon(Icons.search),
          fillcolor: Colors.white60,
        ),
        Obx(() {
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
                      onTap: index == 0
                          ? null
                          : () async  {
                              optionalCompanyController.companyId.value =
                                  widget.companyList[index - 1].id;
                              optionalCompanyController.companyName.value =
                                  widget.companyList[index - 1].companyName;
                             await branchController.fetchBranchesByCompanyId(
                                  widget.companyList[index - 1].id);
                              widget.onSelected();
                            },
                      child: SizedBox(
                        height: 60,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Center(
                                  child: Text(index == 0
                                      ? "Şirket Adı"
                                      : widget
                                          .companyList[index - 1].companyName)),
                            ),
                            Expanded(
                              flex: 2,
                              child: Center(
                                  child: Text(
                                      index == 0 ? "Çalışan Sayısı" : "0")),
                            ),
                            Row(
                              children: [
                                RightIconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: index == 0 ? whiteColor : darkColor,
                                  ),
                                  function: index == 0
                                      ? null
                                      : () => showDialog(
                                            context: context,
                                            builder: (context) => AddNewCompany(
                                              company:
                                                  widget.companyList[index - 1],
                                            ),
                                          ),
                                ),
                                RightIconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: index == 0 ? whiteColor : redColor,
                                  ),
                                  function: index == 0
                                      ? null
                                      : () async {
                                          showDialogAreYouSureDelete(
                                            context,
                                            () async => await companyController
                                                .removeCompany(widget
                                                    .companyList[index - 1].id),
                                          );
                                        },
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

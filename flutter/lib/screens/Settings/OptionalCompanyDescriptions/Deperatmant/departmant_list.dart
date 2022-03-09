// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:vtys_kalite/componenets/custom_right_icon_button.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/models/settings/company.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class DepartmantList extends StatefulWidget {
  const DepartmantList({
    Key? key,
    required this.companyList,
    required this.onCompanySelected,
  }) : super(key: key);

  final List<Company> companyList;
  final Function() onCompanySelected;

  @override
  _DepartmantListState createState() => _DepartmantListState();
}

class _DepartmantListState extends State<DepartmantList> {
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
        SizedBox(
          height: widget.companyList.length > 6
              ? 6 * 60
              : widget.companyList.length * 60,
          child: Obx(() {
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
                          height: 60,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Center(
                                    child: Text(index == 0
                                        ? "Şirket Adı"
                                        : widget.companyList[index - 1]
                                            .companyName)),
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
                                      color:
                                          index == 0 ? whiteColor : darkColor,
                                    ),
                                    function: index == 0 ? null : () {},
                                  ),
                                  RightIconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: index == 0 ? whiteColor : redColor,
                                    ),
                                    function: index == 0 ? null : () {},
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
        ),
      ],
    );
  }
}

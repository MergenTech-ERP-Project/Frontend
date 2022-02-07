import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/settings/branch.dart';
import 'package:vtys_kalite/models/settings/company.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Components/add_new_company.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/models/long_press_company.dart';
import 'package:vtys_kalite/utilities/constants.dart';

import 'Components/add_new_branch.dart';

class OptionalCompanyDescriptions extends StatefulWidget {
  bool company;
  bool branch;
  bool departmant;
  bool title;

  List<Company> companyList = Statics.instance.companyController.companyList;
  List<Branch> branchList = Statics.instance.branchController.branchList;

  OptionalCompanyDescriptions({
    Key? key,
    this.company = false,
    this.branch = false,
    this.departmant = false,
    this.title = false,
  }) : super(key: key);

  @override
  State<OptionalCompanyDescriptions> createState() =>
      _OptionalCompanyDescriptionsState();
}

class _OptionalCompanyDescriptionsState
    extends State<OptionalCompanyDescriptions> {
  final TextEditingController controllerCompanyName = TextEditingController();
  final TextEditingController controllerTelephone = TextEditingController();
  final TextEditingController controllerMail = TextEditingController();
  final TextEditingController controllerMersisNumber = TextEditingController();
  final TextEditingController controllerSGK = TextEditingController();

  final TextEditingController controllerBranchName = TextEditingController();
  final TextEditingController controllerBranchUpper = TextEditingController();
  final TextEditingController controllerRules = TextEditingController();
  final TextEditingController controllerVacationDays = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        cardSirket(),
        SizedBox(height: 20),
        cardSube(),
        SizedBox(height: 20),
        cardDepartmant(),
        SizedBox(height: 20),
        cardUnvan(),
      ],
    );
  }

  Visibility cardUnvan() {
    return Visibility(
      visible: widget.title,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 250),
        child: Card(
          elevation: 10,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 8,
                      child: Text("Unvan", style: kLabelStyle),
                    ),
                    CustomButton(
                      title: "Yeni Ekle",
                      height: 20,
                      pressAction: () {},
                    ),
                  ],
                ),
              ),
              Column(
                children: const [
                  Text("Yazılacak burası", style: kLabelThinStyle),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Visibility cardDepartmant() {
    return Visibility(
      visible: widget.departmant,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 250),
        child: Card(
          elevation: 10,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 8,
                      child: Text("Departman", style: kLabelStyle),
                    ),
                    Expanded(
                      flex: 2,
                      child: CustomButton(
                        title: "Yeni Ekle",
                        height: 20,
                        pressAction: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: const [
                  Text("Yazılacak burası", style: kLabelThinStyle),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Visibility cardSube() {
    return Visibility(
      visible: widget.branch,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 250),
        child: Card(
          elevation: 10,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 8,
                      child: Text("Şube", style: kLabelStyle),
                    ),
                    Expanded(
                      flex: 2,
                      child: CustomButton(
                        height: 20,
                        title: "Yeni Ekle",
                        pressAction: () async {
                          await showDialog(
                            context: context,
                            builder: (_) => AddNewBranch(
                              controllerBranchName: controllerBranchName,
                              controllerBranchUpper: controllerBranchUpper,
                              controllerRules: controllerRules,
                              controllerVacationDays: controllerVacationDays,
                            ),
                          );
                          //Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  const CustomTextBox(
                    borderless: true,
                    hint: "Birim adı giriniz",
                    decorationIcon: Icon(Icons.search),
                    fillcolor: Colors.white60,
                  ),
                  Obx(() {
                    return (Statics.instance.branchController.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.branchList.length + 1,
                            itemBuilder: (_, index) {
                              return InkWell(
                                onTap: index == 0
                                    ? null
                                    : () {
                                        setState(() {
                                          widget.branch = true;
                                        });
                                      },
                                child: SizedBox(
                                  height: 61,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Center(
                                            child: Text(index == 0
                                                ? "Birim Adı"
                                                : widget.branchList[index - 1]
                                                    .branch_name)),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ));
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding cardSirket() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 250),
      child: InkWell(
        onTap: () {
          setState(() {
            widget.company = true;
          });
        },
        child: Card(
          elevation: 10,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 8,
                      child: Text("Şirket", style: kLabelStyle),
                    ),
                    Expanded(
                      flex: 2,
                      child: CustomButton(
                          height: 20,
                          title: "Yeni Ekle",
                          pressAction: () async {
                            await showDialog(
                                context: context,
                                builder: (_) => AddNewCompany(
                                      controllerCompanyName:
                                          controllerCompanyName,
                                      controllerCompanyPhone:
                                          controllerTelephone,
                                      controllerDomainName: controllerMail,
                                      controllerMersisNo:
                                          controllerMersisNumber,
                                      controllerSGKCompanyNo: controllerSGK,
                                    ));
                            //Navigator.pop(context);
                          }),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: widget.company,
                child: Column(
                  children: [
                    const CustomTextBox(
                      borderless: true,
                      hint: "Şirket adı giriniz",
                      decorationIcon: Icon(Icons.search),
                      fillcolor: Colors.white60,
                    ),
                    Obx(() {
                      print(widget.companyList);
                      return (Statics.instance.companyController.isLoading.value
                          ? Center(
                              child: Container(
                              height: 50,
                              width: 50,
                              child: const CircularProgressIndicator(),
                            ))
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: widget.companyList.length + 1,
                              itemBuilder: (_, index) {
                                return InkWell(
                                  onTap: index == 0
                                      ? null
                                      : () {
                                          setState(() {
                                            widget.branch = true;
                                          });
                                        },
                                  onLongPress: index == 0
                                      ? null
                                      : () {
                                          /*PopupMenuButton<MenuItemCompany>(
                                              onSelected: (item) =>
                                                  onSelected(context, item),
                                              itemBuilder: (context) => [
                                                    ...MenuItemsCompany
                                                        .itemsFirst
                                                        .map(buildItemCompany)
                                                        .toList(),
                                                    //PopupMenuDivider();
                                                  ]);*/

                                    showMenu(
                                      context: context,
                                      position: RelativeRect.fill,
                                      items: [
                                        const PopupMenuItem(
                                          child: Text("Menu 1"),
                                        ),
                                        const PopupMenuItem(
                                          child: Text("Menu 2"),
                                        ),
                                        const PopupMenuItem(
                                          child: Text("Menu 3"),
                                        ),
                                      ],
                                      elevation: 8.0,
                                    );
                                        },
                                  child: SizedBox(
                                    height: 61,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Center(
                                              child: Text(index == 0
                                                  ? "Şirket Adı"
                                                  : widget
                                                      .companyList[index - 1]
                                                      .company_name)),
                                        ),
                                        const VerticalDivider(thickness: 3),
                                        Expanded(
                                          child: Center(
                                              child: Text(index == 0
                                                  ? "Çalışan Sayısı"
                                                  : "0")),
                                        ),
                                        PopupMenuButton<MenuItemCompany>(
                                            onSelected: (item) =>
                                                onSelected(context, item),
                                            itemBuilder: (context) => [
                                                  ...MenuItemsCompany.itemsFirst
                                                      .map(buildItemCompany)
                                                      .toList(),
                                                  //PopupMenuDivider();
                                                ]),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ));
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PopupMenuItem<MenuItemCompany> buildItemCompany(MenuItemCompany item) =>
      PopupMenuItem(
        value: item,
        child: Row(
          children: [
            Icon(item.icon, color: Colors.black, size: 20),
            const SizedBox(height: 12),
            Text(item.text),
          ],
        ),
      );

  onSelected(BuildContext context, MenuItemCompany item) {
    setState(() {
      switch (item) {
        case MenuItemsCompany.itemUpdate:
          print("update");
          break;
        case MenuItemsCompany.itemDelete:
          print("delete");
          break;
      }
    });
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Branch/add_new_branch.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Branch/branch_list.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Company/add_new_company.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Company/company_list.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Components/optional_company_card.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Deperatmant/add_new_departmant.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Deperatmant/departmant_list.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Title/add_new_title.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Title/title_list.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class OptionalCompanyDescriptions extends StatefulWidget {
  OptionalCompanyDescriptions({
    Key? key,
  }) : super(key: key) {
    branchController.fetchBranches();
    companyController.fetchCompanies();
    departmentController.fetchDepartments();
    titleController.fetchTitles();
  }

  @override
  State<OptionalCompanyDescriptions> createState() =>
      _OptionalCompanyDescriptionsState();
}

class _OptionalCompanyDescriptionsState
    extends State<OptionalCompanyDescriptions> {
  var controller = ScrollController();

  scrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    controller.animateTo(
      controller.position.maxScrollExtent,
      duration: const Duration(milliseconds: 200),
      curve: Curves.decelerate,
    );
  }

  scrollToTop() async {
    await Future.delayed(const Duration(milliseconds: 100));
    controller.animateTo(
      0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.decelerate,
    );
  }

  double offset = 0;
  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        offset = controller.offset;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            padding: ResponsiveWidget.isSmallScreen(context)
                ? const EdgeInsets.only(left: 5, right: 5, bottom: 50)
                : const EdgeInsets.only(left: 20, right: 20, bottom: 50),
            height: MediaQuery.of(context).size.height * .95,
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                children: [
                  OptionalCompanyCard(
                    visible: optionalCompanyController.companyBool,
                    addNewWidget: AddNewCompany(),
                    title: "Şirketler",
                    childWidget: CompanyList(
                      companyList: companyController.companyList,
                      onSelected: () {
                        optionalCompanyController.branchBool.value = true;
                        optionalCompanyController.departmantBool.value = false;
                        optionalCompanyController.titleBool.value = false;
                        scrollToBottom();
                      },
                    ),
                  ),
                  Obx(
                    () => OptionalCompanyCard(
                      visible: optionalCompanyController.branchBool,
                      addNewWidget: AddNewBranch(),
                      title: "Şubeler",
                      selectedTitle:
                          "(${optionalCompanyController.companyName})",
                      childWidget: BranchList(
                        branchList: branchController.branchList,
                        onSelected: () {
                          optionalCompanyController.departmantBool.value = true;
                          optionalCompanyController.titleBool.value = false;
                          scrollToBottom();
                        },
                      ),
                    ),
                  ),
                  Obx(
                    () => OptionalCompanyCard(
                      visible: optionalCompanyController.departmantBool,
                      addNewWidget: AddNewDepartmant(),
                      title: "Departmanlar",
                      selectedTitle:
                          "(${optionalCompanyController.branchName})",
                      childWidget: DepartmantList(
                        departmentList: departmentController.departmentList,
                        onSelected: () {
                          optionalCompanyController.titleBool.value = true;
                          scrollToBottom();
                        },
                      ),
                    ),
                  ),
                  Obx(
                    () => OptionalCompanyCard(
                      visible: optionalCompanyController.titleBool,
                      addNewWidget: AddNewTitle(),
                      title: "Ünvanlar",
                      selectedTitle:
                          "(${optionalCompanyController.departmanName})",
                      childWidget: TitleList(
                        titleList: titleController.titleList,
                        onSelected: () {
                          scrollToBottom();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 20,
            child: Visibility(
              visible: offset > 0,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: activeColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: scrollToTop,
                  child: Icon(
                    Icons.keyboard_arrow_up,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

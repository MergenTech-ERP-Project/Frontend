// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
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

class OptionalCompanyDescriptions extends StatelessWidget {
  OptionalCompanyDescriptions({
    Key? key,
  }) : super(key: key) {
    branchController.fetchBranches();
    companyController.fetchCompanies();
    departmentController.fetchDepartments();
    titleController.fetchTitles();
  }
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: ResponsiveWidget.isSmallScreen(context)
            ? const EdgeInsets.only(top: 20, left: 5, right: 5)
            : const EdgeInsets.only(top: 20, left: 40, right: 40),
        height: MediaQuery.of(context).size.height * .95,
        child: SingleChildScrollView(
          child: Column(
            children: [
              OptionalCompanyCard(
                visible: optionalCompanyController.companyBool,
                addNewWidget: AddNewCompany(),
                title: "Şirket",
                childWidget: CompanyList(
                  companyList: companyController.companyList,
                  onSelected: () {
                    optionalCompanyController.branchBool.value = true;
                    optionalCompanyController.departmantBool.value = false;
                    optionalCompanyController.titleBool.value = false;
                  },
                ),
              ),
              OptionalCompanyCard(
                visible: optionalCompanyController.branchBool,
                addNewWidget: AddNewBranch(),
                title: "Şube",
                childWidget: BranchList(
                  branchList: branchController.branchList,
                  onSelected: () {
                    optionalCompanyController.departmantBool.value = true;
                    optionalCompanyController.titleBool.value = false;
                  },
                ),
              ),
              OptionalCompanyCard(
                visible: optionalCompanyController.departmantBool,
                addNewWidget: AddNewDepartmant(),
                title: "Departman",
                childWidget: DepartmantList(
                  departmentList: departmentController.departmentList,
                  onSelected: () {
                    optionalCompanyController.titleBool.value = true;
                  },
                ),
              ),
              OptionalCompanyCard(
                visible: optionalCompanyController.titleBool,
                addNewWidget: AddNewTitle(),
                title: "Ünvan",
                childWidget: TitleList(
                  titleList: titleController.titleList,
                  onSelected: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
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
  RxBool company = true.obs;
  RxBool branch = false.obs;
  RxBool departmant = false.obs;
  RxBool title = false.obs;

  OptionalCompanyDescriptions({Key? key}) : super(key: key) {
    branchController.fetchBranches();
    companyController.fetchCompanies();
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
                visible: company,
                addNewWidget: AddNewCompany(),
                title: "Şirket",
                childWidget: CompanyList(
                  companyList: companyController.companyList,
                  onSelected: () {
                    branch.value = true;
                    departmant.value = false;
                    title.value = false;
                  },
                ),
              ),
              OptionalCompanyCard(
                visible: branch,
                addNewWidget: AddNewBranch(),
                title: "Şube",
                childWidget: BranchList(
                  branchList: branchController.branchList,
                  onSelected: () {
                    departmant.value = true;
                    title.value = false;
                  },
                ),
              ),
              OptionalCompanyCard(
                visible: departmant,
                addNewWidget: AddNewDepartmant(),
                title: "Departman",
                childWidget: DepartmantList(
                  departmentList: departmentController.departmentList,
                  onSelected: () {
                    title.value = true;
                  },
                ),
              ),
              OptionalCompanyCard(
                visible: title,
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

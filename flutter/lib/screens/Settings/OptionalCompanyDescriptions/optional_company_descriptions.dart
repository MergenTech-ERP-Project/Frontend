import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/models/settings/branch.dart';
import 'package:vtys_kalite/models/settings/company.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Components/add_new_company.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Components/optional_company_card.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Components/optional_company_sirket.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Components/optional_company_sube.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

import 'Components/add_new_branch.dart';

class OptionalCompanyDescriptions extends StatefulWidget {
  RxBool company = true.obs;
  RxBool branch = false.obs;
  RxBool departmant = false.obs;
  RxBool title = false.obs;

  List<Company> companyList = companyController.companyList;
  List<Branch> branchList = branchController.branchList;

  @override
  State<OptionalCompanyDescriptions> createState() =>
      _OptionalCompanyDescriptionsState();
}

class _OptionalCompanyDescriptionsState
    extends State<OptionalCompanyDescriptions> {
  @override
  void initState() {
    super.initState();
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
                visible: widget.company,
                addNewWidget: AddNewCompany(),
                title: "Şirket",
                childWidget: OptionalCompanySirket(
                  companyList: widget.companyList,
                  onCompanySelected: () {
                    widget.branch.value = true;
                  },
                ),
              ),
              OptionalCompanyCard(
                visible: widget.branch,
                addNewWidget: AddNewBranch(),
                title: "Şube",
                childWidget: OptionalCompanySube(
                  branchList: widget.branchList,
                  onBranchSelected: () {
                    widget.departmant.value = true;
                  },
                ),
              ),
              OptionalCompanyCard(
                visible: widget.departmant,
                addNewWidget: const SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(),
                ),
                title: "Departman",
                childWidget: Column(
                  children: const [
                    CustomText(text: "Soon..."),
                  ],
                ),
              ),
              OptionalCompanyCard(
                visible: widget.title,
                addNewWidget: const SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(),
                ),
                title: "Unvan",
                childWidget: Column(
                  children: const [
                    CustomText(text: "Soon..."),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

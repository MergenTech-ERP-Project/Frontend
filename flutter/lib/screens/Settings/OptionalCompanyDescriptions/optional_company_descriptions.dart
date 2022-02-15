import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/models/settings/branch.dart';
import 'package:vtys_kalite/models/settings/company.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Components/add_new_company.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Components/optional_company_sirket.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Components/optional_company_sube.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

import 'Components/add_new_branch.dart';

class OptionalCompanyDescriptions extends StatefulWidget {
  RxBool company = false.obs;
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
    userController.fetchUsers();
    branchController.fetchBranches();
    companyController.fetchCompanies();
  }

  ScrollController controller = ScrollController();

  //const EdgeInsets.only(top: 50, left: 8, right: 8)
  //: const EdgeInsets.only(top: 80, left: 40, right: 60),

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: ResponsiveWidget.isSmallScreen(context)
            ? const EdgeInsets.only(top: 50, left: 8, right: 8)
            : const EdgeInsets.only(top: 60, left: 40, right: 60),
        height: MediaQuery.of(context).size.height * .95,
        child: Obx(() => SingleChildScrollView(
              child: Column(
                children: [
                  cardSirket(),
                  const SizedBox(height: 20),
                  cardSube(),
                  const SizedBox(height: 20),
                  cardDepartmant(),
                  const SizedBox(height: 20),
                  cardUnvan(),
                ],
              ),
            )),
      ),
    );
  }

  Visibility cardUnvan() {
    return Visibility(
      visible: widget.title.value,
      child: InkWell(
        onTap: () {
          widget.title.value = !widget.title.value;
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
                    const CustomText(text: "Unvan", weight: FontWeight.bold),
                    CustomButton(
                      width: 125,
                      height: 20,
                      title: "Yeni Ekle",
                      pressAction: () {},
                    ),
                  ],
                ),
              ),
              Column(
                children: const [
                  CustomText(text: "Yazılacak burası"),
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
      visible: widget.departmant.value,
      child: InkWell(
        onTap: () {
          widget.departmant.value = !widget.departmant.value;
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
                    const CustomText(
                        text: "Departman", weight: FontWeight.bold),
                    CustomButton(
                      title: "Yeni Ekle",
                      width: 125,
                      height: 20,
                      pressAction: () {},
                    ),
                  ],
                ),
              ),
              Column(
                children: const [
                  CustomText(text: "Yazılacak burası"),
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
      visible: widget.branch.value,
      child: InkWell(
        onTap: () {
          widget.branch.value = !widget.branch.value;
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
                    const CustomText(text: "Şube", weight: FontWeight.bold),
                    CustomButton(
                        width: 125,
                        height: 20,
                        leftIcon: Icons.add,
                        title: "Yeni Ekle",
                        pressAction: () async {
                          await showDialog(
                            context: context,
                            builder: (_) => AddNewBranch(),
                          );
                        })
                  ],
                ),
              ),
              OptionalCompanySube(
                branchList: widget.branchList,
                onBranchSelected: () {
                  widget.departmant.value = true;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardSirket() {
    return InkWell(
      onTap: () {
        widget.company.value = !widget.company.value;
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
                  const CustomText(text: "Şirket", weight: FontWeight.bold),
                  CustomButton(
                      width: 125,
                      height: 20,
                      leftIcon: Icons.add,
                      title: "Yeni Ekle",
                      pressAction: () async {
                        await showDialog(
                            context: context, builder: (_) => AddNewCompany());
                      })
                ],
              ),
            ),
            Visibility(
              visible: widget.company.value,
              child: OptionalCompanySirket(
                companyList: widget.companyList,
                onCompanySelected: () {
                  widget.branch.value = true;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

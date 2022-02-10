import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/core/statics.dart';
import 'package:vtys_kalite/models/settings/branch.dart';
import 'package:vtys_kalite/models/settings/company.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Components/add_new_company.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Components/optional_company_sirket.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Components/optional_company_sube.dart';
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
    this.company = true,
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
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: Text(""),
        ),
        Expanded(
          flex: 2,
          child: ListView(
            shrinkWrap: true,
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
        ),
        const Expanded(
          flex: 1,
          child: Text(""),
        ),
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
      child: InkWell(
        onTap: () {
          setState(() {
            widget.departmant = !widget.departmant;
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
      child: InkWell(
        onTap: () {
          setState(() {
            widget.branch = !widget.branch;
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
                            builder: (_) => AddNewBranch(),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              OptionalCompanySube(
                branchList: widget.branchList,
                onBranchSelected: () {
                  setState(() {
                    widget.departmant = true;
                  });
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
        setState(() {
          widget.company = !widget.company;
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
                    flex: 3,
                    child: CustomButton(
                        height: 20,
                        title: "Yeni Ekle",
                        pressAction: () async {
                          await showDialog(
                              context: context,
                              builder: (_) => AddNewCompany());
                        }),
                  )
                ],
              ),
            ),
            Visibility(
              visible: widget.company,
              child: OptionalCompanySirket(
                companyList: widget.companyList,
                onCompanySelected: () {
                  setState(() {
                    widget.branch = true;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

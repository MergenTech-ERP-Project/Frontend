// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:vtys_kalite/componenets/custom_right_icon_button.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/helpers/helpers.dart';
import 'package:vtys_kalite/models/settings/department.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Deperatmant/add_new_departmant.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class DepartmantList extends StatefulWidget {
  const DepartmantList({
    Key? key,
    required this.departmentList,
    required this.onSelected,
  }) : super(key: key);

  final List<Department> departmentList;
  final Function() onSelected;

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
          hint: "Departman adı giriniz",
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
                  itemCount: widget.departmentList.length + 1,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: index == 0
                          ? null
                          : () {
                              optionalCompanyController.departmentId.value =
                                  widget.departmentList[index].id;
                              branchController.fetchBranchesByCompanyId(
                                  widget.departmentList[index].id);
                              widget.onSelected;
                            },
                      child: SizedBox(
                        height: 60,
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                  child: Text(index == 0
                                      ? "Departman Adı"
                                      : widget.departmentList[index - 1]
                                          .departmentName)),
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
                                          builder: (context) =>
                                              AddNewDepartmant(
                                                department: widget
                                                    .departmentList[index - 1],
                                              )),
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
                                              () async => departmentController
                                                  .removeDepartment(widget
                                                      .departmentList[index - 1]
                                                      .id));
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

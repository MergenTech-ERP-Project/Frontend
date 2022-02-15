import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:vtys_kalite/componenets/custom_right_icon_button.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/models/settings/branch.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class OptionalCompanySube extends StatefulWidget {
  const OptionalCompanySube({
    Key? key,
    required this.branchList,
    required this.onBranchSelected,
  }) : super(key: key);

  final List<Branch> branchList;
  final Function() onBranchSelected;

  @override
  _OptionalCompanySubeState createState() => _OptionalCompanySubeState();
}

class _OptionalCompanySubeState extends State<OptionalCompanySube> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextBox(
          borderless: true,
          hint: "Birim adı giriniz",
          decorationIcon: const Icon(Icons.search),
          fillcolor: Colors.white60,
        ),
        Obx(() {
          return (branchController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.branchList.length + 1,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: index == 0 ? null : widget.onBranchSelected,
                      child: SizedBox(
                        height: 61,
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  index == 0
                                      ? "Birim Adı"
                                      : widget
                                          .branchList[index - 1].branch_name,
                                ),
                              ),
                            ),
                            index == 0
                                ? Row(
                                    children: [
                                      RightIconButton(
                                        icon:
                                            Icon(Icons.edit, color: whiteColor),
                                        function: () {},
                                      ),
                                      RightIconButton(
                                        icon: Icon(Icons.delete,
                                            color: whiteColor),
                                        function: () {},
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      RightIconButton(
                                        icon:
                                            Icon(Icons.edit, color: darkColor),
                                        function: () {},
                                      ),
                                      RightIconButton(
                                        icon:
                                            Icon(Icons.delete, color: redColor),
                                        function: () {},
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

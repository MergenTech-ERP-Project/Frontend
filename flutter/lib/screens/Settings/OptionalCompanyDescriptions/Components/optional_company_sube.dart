import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/models/settings/branch.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class OptionalCompanySube extends StatefulWidget {
  OptionalCompanySube({
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
          decorationIcon: Icon(Icons.search),
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
                                  child: Text(index == 0
                                      ? "Birim Adı"
                                      : widget
                                          .branchList[index - 1].branch_name)),
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

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:vtys_kalite/componenets/custom_right_icon_button.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/models/settings/branch.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class BranchList extends StatefulWidget {
  const BranchList({
    Key? key,
    required this.branchList,
    required this.onBranchSelected,
  }) : super(key: key);

  final List<Branch> branchList;
  final Function() onBranchSelected;

  @override
  _BranchListState createState() => _BranchListState();
}

class _BranchListState extends State<BranchList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextBox(
          borderless: true,
          hint: "Birim adı giriniz",
          decorationIcon: Icon(Icons.search),
          fillcolor: Colors.white60,
        ),
        SizedBox(
          height: widget.branchList.length > 6
              ? 6 * 60
              : widget.branchList.length * 60,
          child: Obx(() {
            return (branchController.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.branchList.length + 1,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: index == 0 ? null : widget.onBranchSelected,
                        child: SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    index == 0
                                        ? "Birim Adı"
                                        : widget
                                            .branchList[index - 1].branchName,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  RightIconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      color:
                                          index == 0 ? whiteColor : darkColor,
                                    ),
                                    function: index == 0 ? null : () {},
                                  ),
                                  RightIconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: index == 0 ? whiteColor : redColor,
                                    ),
                                    function: index == 0 ? null : () {},
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
        ),
      ],
    );
  }
}

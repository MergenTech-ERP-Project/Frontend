// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/models/settings/branch.dart';
import 'package:vtys_kalite/models/settings/company.dart';
import 'package:vtys_kalite/models/settings/department.dart';
import 'package:vtys_kalite/utilities/style.dart';

class GenericDropDownList<T> extends StatefulWidget {
  GenericDropDownList({
    Key? key,
    required this.genericList,
    required this.onSelected,
    required this.isLoading,
    required this.childVisible,
    required this.childGenericList,
  }) : super(key: key);

  final List<T> genericList;
  final Widget childGenericList;
  dynamic onSelected;
  final bool isLoading, childVisible;

  var childIndex = (-1);

  @override
  _GenericDropDownListState createState() => _GenericDropDownListState<T>();
}

class _GenericDropDownListState<T> extends State<GenericDropDownList> {
  getText(int index) {
    switch (T) {
      case Company:
        return widget.genericList[index].companyName;
      case Branch:
        return widget.genericList[index].branchName;
      case Department:
        return widget.genericList[index].departmentName;
      case Title:
        return widget.genericList[index].titleName;
      default:
        return "";
    }
  }

  int selected = -1; //attention
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (widget.isLoading
          ? const Center(
              child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            ))
          : ListView.builder(
              key: Key('builder ${selected.toString()}'), //attention
              shrinkWrap: true,
              itemCount: widget.genericList.length,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color(0x11000000),
                    border: Border.all(color: activeColor),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ExpansionTile(
                    iconColor: blackColor,
                    key: Key(index.toString()), //attention
                    initiallyExpanded: index == selected,
                    title: SizedBox(
                      height: 60,
                      child: Center(
                        child: CustomText(
                          text: getText(index),
                        ),
                      ),
                    ),

                    onExpansionChanged: (expanded) async {
                      if (expanded) {
                        setState(() {
                          selected = index;
                        });
                        await widget.onSelected(widget.genericList[index]);
                        await Future.delayed(const Duration(seconds: 1));
                      } else {
                        setState(() {
                          selected = -1;
                        });
                      }
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: widget.childGenericList,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ));
    });
  }
}

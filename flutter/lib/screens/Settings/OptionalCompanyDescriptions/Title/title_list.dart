// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_right_icon_button.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/helpers/helpers.dart';
import 'package:vtys_kalite/models/settings/title.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Title/add_new_title.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class TitleList extends StatefulWidget {
  const TitleList({
    Key? key,
    required this.titleList,
    required this.onSelected,
  }) : super(key: key);

  final List<Titlee> titleList;
  final Function() onSelected;

  @override
  _TitleListState createState() => _TitleListState();
}

class _TitleListState extends State<TitleList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextBox(
          borderless: true,
          hint: "Ünvan adı giriniz",
          decorationIcon: Icon(Icons.search),
          fillcolor: Colors.white60,
        ),
        Obx(() {
          return (titleController.isLoading.value
              ? const Center(
                  child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.titleList.length + 1,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: index == 0
                          ? null
                          : () async {
                              optionalCompanyController.titleId.value =
                                  widget.titleList[index - 1].id;
                              widget.onSelected;
                            },
                      child: SizedBox(
                        height: 60,
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                  child: Text(index == 0
                                      ? "Ünvan Adı"
                                      : widget.titleList[index - 1].titleName)),
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
                                            builder: (context) => AddNewTitle(
                                              titlee:
                                                  widget.titleList[index - 1],
                                            ),
                                          ),
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
                                            () async => await titleController
                                                .removeTitle(
                                              widget.titleList[index - 1].id,
                                            ),
                                          );
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

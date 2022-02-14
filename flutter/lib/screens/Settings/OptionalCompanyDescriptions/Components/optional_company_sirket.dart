import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/models/settings/company.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Components/update_delete_popup_menu_button.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class OptionalCompanySirket extends StatefulWidget {
  OptionalCompanySirket({
    Key? key,
    required this.companyList,
    required this.onCompanySelected,
  }) : super(key: key);

  final List<Company> companyList;
  final Function() onCompanySelected;

  @override
  _OptionalCompanySirketState createState() => _OptionalCompanySirketState();
}

class _OptionalCompanySirketState extends State<OptionalCompanySirket> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextBox(
          borderless: true,
          hint: "Şirket adı giriniz",
          decorationIcon: Icon(Icons.search),
          fillcolor: Colors.white60,
        ),
        Obx(() {
          print(widget.companyList);
          return (companyController.isLoading.value
              ? Center(
                  child: Container(
                  height: 50,
                  width: 50,
                  child: const CircularProgressIndicator(),
                ))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.companyList.length + 1,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: index == 0 ? null : widget.onCompanySelected,
                      child: SizedBox(
                        height: 61,
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                  child: Text(index == 0
                                      ? "Şirket Adı"
                                      : widget.companyList[index - 1]
                                          .company_name)),
                            ),
                            const VerticalDivider(thickness: 3),
                            Expanded(
                              child: Center(
                                  child: Text(
                                      index == 0 ? "Çalışan Sayısı" : "0")),
                            ),
                            index == 0
                                ? const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      child: Icon(Icons.three_k_outlined,
                                          color: Colors.white),
                                    ),
                                  )
                                : const UpdateDeletePopupMenuButton(),
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

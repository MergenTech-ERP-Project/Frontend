// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/controller/Frontend%20Controller/user_helper_controller.dart';
import 'package:vtys_kalite/enums/bank_account_type.dart';
import 'package:vtys_kalite/enums/bank_names.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_customdropdownmenu.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_name_controller.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class TabAnotherInformationSmall extends StatefulWidget {
  final UserHelperController userHelper;

  const TabAnotherInformationSmall({
    Key? key,
    required this.userHelper,
  }) : super(key: key);

  @override
  _TabAnotherInformationSmallState createState() =>
      _TabAnotherInformationSmallState();
}

class _TabAnotherInformationSmallState
    extends State<TabAnotherInformationSmall> {
  bool isVisibleAdress = true;
  bool isVisibleBank = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        InkWell(
          child: CardAdressInformation(),
          onTap: () {
            setState(() {
              isVisibleAdress = !isVisibleAdress;
            });
          },
        ),
        const SizedBox(height: 20),
        InkWell(
          child: CardBankInformation(),
          onTap: () {
            setState(() {
              isVisibleBank = !isVisibleBank;
            });
          },
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget CardBankInformation() {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomText(
                  text: "Banka Bilgileri",
                  size: 26,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: isVisibleBank
                    ? const Icon(Icons.keyboard_arrow_down, size: 20)
                    : const Icon(Icons.keyboard_arrow_up, size: 20),
              )
            ],
          ),
          const Divider(),
          Visibility(
            visible: isVisibleBank,
            child: ListView(
              shrinkWrap: true,
              children: [
                ExpandedCustomDropDownMenu(
                  value: widget.userHelper.userDetail!.bankNames.getName,
                  label: "Banka Adı",
                  listExtension: BankNamesEnumExtension.getList(),
                  onChanged: (val) {
                    setState(() {
                      widget.userHelper.userDetail!.bankNames =
                          BankNamesEnumExtension.getEnumFromName(val);
                    });
                  },
                ),
                ExpandedCustomDropDownMenu(
                  label: "Hesap Tipi",
                  value: widget.userHelper.userDetail!.bankAccountType.getName,
                  listExtension: BankAccountTypeExtension.getList(),
                  onChanged: (val) {
                    setState(() {
                      widget.userHelper.userDetail!.bankAccountType =
                          BankNamesEnumExtension.getEnumFromName(val);
                    });
                  },
                ),
                ExpandedNameController(
                  controller:
                      tabDigerBilgilerController.controllerAccountNumber,
                  label: "Hesap No",
                  widget: const SizedBox(),
                ),
                ExpandedNameController(
                  controller: tabDigerBilgilerController.controllerIBAN,
                  label: "IBAN",
                  widget: const SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Card CardAdressInformation() {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomText(
                  text: "Adres Bilgileri",
                  size: 26,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: isVisibleAdress
                    ? const Icon(Icons.keyboard_arrow_down, size: 20)
                    : const Icon(Icons.keyboard_arrow_up, size: 20),
              )
            ],
          ),
          const Divider(),
          Visibility(
            visible: isVisibleAdress,
            child: ListView(
              shrinkWrap: true,
              children: [
                ExpandedNameController(
                  controller: tabDigerBilgilerController.controllerAdress,
                  label: "Adres Bilgileri",
                  widget: const SizedBox(),
                ),
                ExpandedNameController(
                  controller: tabDigerBilgilerController.controllerHomePhone,
                  label: "Ev Telefonu",
                  widget: const SizedBox(),
                ),
                ExpandedNameController(
                  controller: tabDigerBilgilerController.controllerZipCode,
                  label: "Posta Kodu",
                  widget: const SizedBox(),
                ),
                ExpandedNameController(
                  controller: tabDigerBilgilerController.controllerCountry,
                  label: "Ülke",
                  widget: const SizedBox(),
                ),
                ExpandedNameController(
                  controller: tabDigerBilgilerController.controllerCity,
                  label: "Şehir",
                  widget: const SizedBox(),
                ),
                ExpandedNameController(
                  controller: tabDigerBilgilerController.controllerDistrict,
                  label: "İlçe",
                  widget: const SizedBox(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

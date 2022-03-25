// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_dropdownitems.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/enums/bank_account_type.dart';
import 'package:vtys_kalite/enums/bank_names.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_name_controller.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class TabAnotherInformation extends StatefulWidget {
  @override
  _TabAnotherInformationState createState() => _TabAnotherInformationState();
}

class _TabAnotherInformationState extends State<TabAnotherInformation> {
  bool isVisibleAdress = true;
  bool isVisibleBank = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomDropDownMenu(
                          isExpandedYes: true,
                          iconSize: 20,
                          icon: const Icon(Icons.arrow_drop_down),
                          valueChoose: userHelper.userDetail!.bankNames.getName,
                          text: "Banka Adı",
                          list: BankNamesEnumExtension.getList(),
                          onChanged: (val) {
                            setState(() {
                              userHelper.userDetail!.bankNames =
                                  BankNamesEnumExtension.getEnumFromName(val);
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomDropDownMenu(
                          isExpandedYes: true,
                          iconSize: 20,
                          icon: const Icon(Icons.arrow_drop_down),
                          text: "Hesap Tipi",
                          valueChoose:
                              userHelper.userDetail!.bankAccountType.getName,
                          list: BankAccountTypeExtension.getList(),
                          onChanged: (val) {
                            setState(() {
                              userHelper.userDetail!.bankAccountType =
                                  BankAccountTypeExtension.getEnumFromName(val);
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: NameController(
                        controller:
                            tabDigerBilgilerController.controllerAccountNumber,
                        label: "Hesap No",
                        widget: const SizedBox(),
                      ),
                    ),
                    Expanded(
                      child: NameController(
                        controller: tabDigerBilgilerController.controllerIBAN,
                        label: "IBAN",
                        widget: const SizedBox(),
                      ),
                    ),
                  ],
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
                NameController(
                  controller: tabDigerBilgilerController.controllerAdress,
                  label: "Adres Bilgileri",
                  widget: const SizedBox(),
                ),
                Row(
                  children: [
                    Expanded(
                      child: NameController(
                        controller:
                            tabDigerBilgilerController.controllerHomePhone,
                        label: "Ev Telefonu",
                        widget: const SizedBox(),
                      ),
                    ),
                    Expanded(
                      child: NameController(
                        controller:
                            tabDigerBilgilerController.controllerZipCode,
                        label: "Posta Kodu",
                        widget: const SizedBox(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: NameController(
                        controller:
                            tabDigerBilgilerController.controllerCountry,
                        label: "Ülke",
                        widget: const SizedBox(),
                      ),
                    ),
                    Expanded(
                      child: NameController(
                        controller: tabDigerBilgilerController.controllerCity,
                        label: "Şehir",
                        widget: const SizedBox(),
                      ),
                    ),
                    Expanded(
                      child: NameController(
                        controller:
                            tabDigerBilgilerController.controllerDistrict,
                        label: "İlçe",
                        widget: const SizedBox(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/enums/bank_names.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/controller/tab_diger_bilgiler_controller.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_customdropdownmenu.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class TabAnotherInformation extends StatefulWidget {
  TabAnotherInformation({Key? key}) : super(key: key);

  @override
  _TabAnotherInformationState createState() => _TabAnotherInformationState();
}

class _TabAnotherInformationState extends State<TabAnotherInformation> {
  bool isVisibleAdress = false;
  bool isVisibleBank = false;

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
                    ExpandedCustomDropDownMenu(
                      label: "Banka Adı",
                      index: tabDigerBilgilerController.bankNameIndex,
                      listExtension: BankNamesEnumExtension.getList(),
                    ),
                    Expanded(
                      child: CustomTextBox(
                        borderless: true,
                        controller:
                            tabDigerBilgilerController.controllerAccountNumber,
                        label: "Hesap Tipi",
                        suffixWidget: const Icon(Icons.arrow_drop_down),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextBox(
                        borderless: true,
                        controller:
                            tabDigerBilgilerController.controllerAccountNumber,
                        label: "Hesap No",
                        suffixWidget: const SizedBox(),
                      ),
                    ),
                    Expanded(
                      child: CustomTextBox(
                        borderless: true,
                        controller: tabDigerBilgilerController.controllerIBAN,
                        label: "IBAN",
                        suffixWidget: const SizedBox(),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 19,
                        child: CustomTextBox(
                          borderless: true,
                          controller:
                              tabDigerBilgilerController.controllerAdress,
                          label: "Adres Bilgileri",
                        ),
                      ),
                      const Flexible(
                        flex: 1,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextBox(
                        borderless: true,
                        controller:
                            tabDigerBilgilerController.controllerHomePhone,
                        label: "Ev Telefonu",
                        suffixWidget: const SizedBox(),
                      ),
                    ),
                    Expanded(
                      child: CustomTextBox(
                        borderless: true,
                        controller:
                            tabDigerBilgilerController.controllerCountry,
                        label: "Ülke",
                        suffixWidget: const Icon(Icons.arrow_drop_down),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextBox(
                        borderless: true,
                        controller: tabDigerBilgilerController.controllerCity,
                        label: "Şehir",
                        suffixWidget: const SizedBox(),
                      ),
                    ),
                    Expanded(
                      child: CustomTextBox(
                        borderless: true,
                        controller:
                            tabDigerBilgilerController.controllerDistrict,
                        label: "İlçe",
                        suffixWidget: const Icon(Icons.keyboard_arrow_down),
                      ),
                    ),
                    Expanded(
                      child: CustomTextBox(
                        borderless: true,
                        controller:
                            tabDigerBilgilerController.controllerZipCode,
                        label: "Posta Kodu",
                        suffixWidget: const Icon(Icons.keyboard_arrow_down),
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

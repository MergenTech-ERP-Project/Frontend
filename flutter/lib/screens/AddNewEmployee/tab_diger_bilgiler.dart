// ignore_for_file: non_constant_identifier_names

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/enums/bank_account_type.dart';
import 'package:vtys_kalite/enums/bank_names.dart';
import 'package:vtys_kalite/models/User%20Detail/user_detail.dart';
import 'package:vtys_kalite/models/user.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_customdropdownmenu.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/widgets/expanded_name_controller.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class TabAnotherInformation extends StatefulWidget {
  final User? user;
  final UserDetail? userDetail;

  const TabAnotherInformation({
    Key? key,
    required this.user,
    required this.userDetail,
  }) : super(key: key);

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
                    ExpandedCustomDropDownMenu(
                      label: "Banka Adı",
                      index: widget.userDetail!.bankNames!.index,
                      listExtension: BankNamesEnumExtension.getList(),
                      onChanged: (val) {
                        setState(() {
                          widget.userDetail!.bankNames =
                              EnumToString.fromString(
                                  BankNamesEnum.values, val.toString());
                        });
                      },
                    ),
                    ExpandedCustomDropDownMenu(
                      label: "Hesap Tipi",
                      index:  widget.userDetail!.bankAccountType!.index,
                      listExtension: BankAccountTypeExtension.getList(),
                      onChanged: (val) {
                        setState(() {
                          widget.userDetail!.bankAccountType =
                              EnumToString.fromString(
                                  BankAccountTypeEnum.values, val.toString());
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
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
                Row(
                  children: [
                    ExpandedNameController(
                      controller:
                          tabDigerBilgilerController.controllerHomePhone,
                      label: "Ev Telefonu",
                      widget: const SizedBox(),
                    ),
                    ExpandedNameController(
                      controller: tabDigerBilgilerController.controllerZipCode,
                      label: "Posta Kodu",
                      widget: const SizedBox(),
                    ),
                  ],
                ),
                Row(
                  children: [
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

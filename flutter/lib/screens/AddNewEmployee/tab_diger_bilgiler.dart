import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/utilities/constants.dart';

import 'components/tab_custom_textbox_use.dart';

class TabAnotherInformation extends StatefulWidget {
  TextEditingController controllerAdressInformation = TextEditingController();
  TextEditingController controllerHomePhone = TextEditingController();
  TextEditingController controllerCountry = TextEditingController();
  TextEditingController controllerCity = TextEditingController();
  TextEditingController controllerPostCode = TextEditingController();

  TextEditingController controllerBankName = TextEditingController();
  TextEditingController controllerAccountType = TextEditingController();
  TextEditingController controllerAccountNo = TextEditingController();
  TextEditingController controllerIBAN = TextEditingController();

  TabAnotherInformation({Key? key}) : super(key: key);

  @override
  _TabAnotherInformationState createState() => _TabAnotherInformationState();
}

class _TabAnotherInformationState extends State<TabAnotherInformation> {
  bool isVisibleAdress = false;
  bool isVisibleBank = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
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

  Card CardBankInformation() {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Banka Bilgileri", style: kLabelStyle),
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
                      child: TabCustomTextBoxUse(
                        controller: widget.controllerBankName,
                        label: "Banka Adı",
                        widgetIcon: const SizedBox(),
                      ),
                    ),
                    Expanded(
                      child: TabCustomTextBoxUse(
                        controller: widget.controllerAccountType,
                        label: "Hesap Tipi",
                        widgetIcon: const Icon(Icons.arrow_drop_down),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TabCustomTextBoxUse(
                        controller: widget.controllerAccountNo,
                        label: "Hesap No",
                        widgetIcon: const SizedBox(),
                      ),
                    ),
                    Expanded(
                      child: TabCustomTextBoxUse(
                        controller: widget.controllerIBAN,
                        label: "IBAN",
                        widgetIcon: const SizedBox(),
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
                child: Text("Adres Bilgileri", style: kLabelStyle),
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
                          controller: widget.controllerAdressInformation,
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
                      child: TabCustomTextBoxUse(
                        controller: widget.controllerHomePhone,
                        label: "Ev Telefonu",
                        widgetIcon: const SizedBox(),
                      ),
                    ),
                    Expanded(
                      child: TabCustomTextBoxUse(
                        controller: widget.controllerCountry,
                        label: "Ülke",
                        widgetIcon: const Icon(Icons.arrow_drop_down),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TabCustomTextBoxUse(
                        controller: widget.controllerCity,
                        label: "Şehir",
                        widgetIcon: const SizedBox(),
                      ),
                    ),
                    Expanded(
                      child: TabCustomTextBoxUse(
                        controller: widget.controllerPostCode,
                        label: "Posta Kodu",
                        widgetIcon: const Icon(Icons.keyboard_arrow_down),
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

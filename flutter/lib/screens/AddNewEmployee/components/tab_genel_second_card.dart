import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/screens/AddNewEmployee/components/tab_custom_textbox_use.dart';
import 'package:vtys_kalite/utilities/constants.dart';

class TabGenelSecondCard extends StatelessWidget {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerSurname = TextEditingController();
  TextEditingController controllerEPostaWork = TextEditingController();
  TextEditingController controllerEPostaPersonal = TextEditingController();
  TextEditingController controllerTelephoneWork = TextEditingController();
  TextEditingController controllerTelephonePersonal = TextEditingController();

  TextEditingController controllerAccessType = TextEditingController();
  TextEditingController controllerContractType = TextEditingController();
  TextEditingController controllerContractEndDate = TextEditingController();

  DateTime dateOfStart = DateTime.now();
  DateTime contractEndDate = DateTime.now();
  var screenSize;

  TabGenelSecondCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return AboutPersonal();
  }

  Widget AboutPersonal() {
    return Expanded(
      flex: 4,
      child: SingleChildScrollView(
        child: Column(
          //shrinkWrap: true,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text("Genel Bilgiler",
                  style: kLabelHeader2Style, textAlign: TextAlign.center),
            ),
            Row(
              children: [
                Expanded(
                  child: TabCustomTextBoxUse(
                    controller: controllerName,
                    label: "Ad",
                    widgetIcon: const SizedBox(),
                  ),
                ),
                Expanded(
                  child: TabCustomTextBoxUse(
                    controller: controllerSurname,
                    label: "Soyad",
                    widgetIcon: const SizedBox(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TabCustomTextBoxUse(
                    controller: controllerEPostaWork,
                    label: "E-Posta (İş)",
                    widgetIcon: const SizedBox(),
                  ),
                ),
                Expanded(
                  child: TabCustomTextBoxUse(
                    controller: controllerEPostaPersonal,
                    label: "E-Posta (Genel)",
                    widgetIcon: const SizedBox(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TabCustomTextBoxUse(
                    controller: controllerTelephoneWork,
                    label: "Telefon (İş)",
                    widgetIcon: const SizedBox(),
                  ),
                ),
                Expanded(
                  child: TabCustomTextBoxUse(
                    controller: controllerTelephonePersonal,
                    label: "Telefon (Kişisel)",
                    widgetIcon: const SizedBox(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: CustomDateTimePicker(
                            labelText: "İşe Başlangıç Tarihi",
                            borderless: true,
                            onChanged: (val) {
                              if (val != null) {
                                print("DateTime picker : " + val);
                              }
                              try {
                                dateOfStart = dateTimeFormat.parse(val!);
                              } catch (e) {
                                print(e.toString());
                              }
                            },
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Icon(Icons.calendar_today_outlined),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabCustomTextBoxUse(
                    controller: controllerAccessType,
                    label: "Erişim Türü",
                    widgetIcon: const Icon(Icons.keyboard_arrow_down),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TabCustomTextBoxUse(
                    controller: controllerContractType,
                    label: "Sözleşme Türü",
                    widgetIcon: const Icon(Icons.keyboard_arrow_down),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      //scrollDirection: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: CustomDateTimePicker(
                            labelText: "Sözleşme Bitiş Tarihi",
                            borderless: true,
                            onChanged: (val) {
                              if (val != null) {
                                print("DateTime picker : " + val);
                              }
                              try {
                                contractEndDate = dateTimeFormat.parse(val!);
                              } catch (e) {
                                print(e.toString());
                              }
                            },
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Icon(Icons.calendar_today_outlined),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

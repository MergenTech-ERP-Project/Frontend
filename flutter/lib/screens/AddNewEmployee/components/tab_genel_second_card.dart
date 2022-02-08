import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
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
              padding: EdgeInsets.only(top: 8.0),
              child: Text("Genel Bilgiler",
                  style: kLabelHeader2Style, textAlign: TextAlign.center),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomTextBox(
                      borderless: true,
                      controller: controllerName,
                      label: "Ad",
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomTextBox(
                      borderless: true,
                      controller: controllerSurname,
                      label: "Soyad",
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomTextBox(
                      borderless: true,
                      controller: controllerEPostaWork,
                      label: "E-Posta (İş)",
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomTextBox(
                      borderless: true,
                      controller: controllerEPostaPersonal,
                      label: "E-Posta (Genel)",
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomTextBox(
                      borderless: true,
                      controller: controllerTelephoneWork,
                      label: "Telefon (İş)",
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomTextBox(
                      borderless: true,
                      controller: controllerTelephonePersonal,
                      label: "Telefon (Kişisel)",
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 9,
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
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 9,
                          child: CustomTextBox(
                            borderless: true,
                            controller: controllerAccessType,
                            label: "Erişim Türü",
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Icon(Icons.keyboard_arrow_down),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 9,
                          child: CustomTextBox(
                            borderless: true,
                            controller: controllerContractType,
                            label: "Sözleşme Türü",
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Icon(Icons.keyboard_arrow_down),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      //scrollDirection: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 9,
                          child: CustomDateTimePicker(
                            labelText: "Sözleşme Bitiş Tarihi",
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

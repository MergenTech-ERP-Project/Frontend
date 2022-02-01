import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/utilities/constants.dart';

class ReferencesPage extends StatefulWidget {
  const ReferencesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ReferencesPage> createState() => _ReferencesPageState();
}

class _ReferencesPageState extends State<ReferencesPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 250),
            child: Card(
              elevation: 10,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Şirket", style: kLabelStyle),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Yeni Ekle"),
                      )
                    ],
                  ),
                  const CustomTextBox(
                    borderless: true,
                    hint: "Birim adı giriniz",
                    decorationIcon: Icon(Icons.search),
                  ),
                  Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Adı", style: kLabelStyle),
                            Text("Çalışan Sayısı", style: kLabelStyle),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Mergen Yazılım", style: kLabelThinStyle),
                            Text("1 çalışan", style: kLabelThinStyle),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

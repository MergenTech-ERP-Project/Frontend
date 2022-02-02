import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/utilities/constants.dart';

class ReferencesPage extends StatefulWidget {
  bool sirket;
  bool sube;
  bool departman;
  bool unvan;

  ReferencesPage({
    Key? key,
    this.sirket = true,
    this.sube = false,
    this.departman = false,
    this.unvan = false,
  }) : super(key: key);

  @override
  State<ReferencesPage> createState() => _ReferencesPageState();
}

class _ReferencesPageState extends State<ReferencesPage> {


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 250),
          child: Card(
            elevation: 10,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Şirket", style: kLabelStyle),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.sirket = false;
                            widget.sube = true;
                          });
                        },
                        child: Text("Yeni Ekle"),
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: widget.sirket,
                  child: Column(
                    children: [
                      const CustomTextBox(
                        borderless: true,
                        hint: "Birim adı giriniz",
                        decorationIcon: Icon(Icons.search),
                        fillcolor: Colors.white60,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 250),
          child: Card(
            elevation: 10,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Şube", style: kLabelStyle),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.sube = false;
                            widget.departman = true;
                          });
                        },
                        child: Text("Yeni Ekle"),
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: widget.sube,
                  child: Column(
                    children: [
                      Text("Yazılacak burası", style: kLabelThinStyle),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 250),
          child: Card(
            elevation: 10,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Departman", style: kLabelStyle),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.departman = false;
                            widget.unvan = true;
                          });
                        },
                        child: Text("Yeni Ekle"),
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: widget.departman,
                  child: Column(
                    children: [
                      Text("Yazılacak burası", style: kLabelThinStyle),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 250),
          child: Card(
            elevation: 10,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Unvan", style: kLabelStyle),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.unvan = false;
                          });
                        },
                        child: Text("Yeni Ekle"),
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: widget.unvan,
                  child: Column(
                    children: [
                      Text("Yazılacak burası", style: kLabelThinStyle),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/Components/add_new_company.dart';
import 'package:vtys_kalite/utilities/constants.dart';

import 'Components/add_new_branch.dart';

class OptionalCompanyDescriptions extends StatefulWidget {
  bool sirket;
  bool sube;
  bool departman;
  bool unvan;

  OptionalCompanyDescriptions({
    Key? key,
    this.sirket = false,
    this.sube = false,
    this.departman = false,
    this.unvan = false,
  }) : super(key: key);

  @override
  State<OptionalCompanyDescriptions> createState() => _OptionalCompanyDescriptionsState();
}

class _OptionalCompanyDescriptionsState extends State<OptionalCompanyDescriptions> {
  /*Bu listler geçici olarak girildi. Yakında database'den çekilecek*/
  List<String> sirketAdi = ["Mergen Yazılım", "OmerFaruk"];
  List<String> calisanSayisi = ["1 çalışan", "1 çalışan"];

  final TextEditingController controllerCompanyName = TextEditingController();
  final TextEditingController controllerTelephone = TextEditingController();
  final TextEditingController controllerMail = TextEditingController();
  final TextEditingController controllerMersisNumber = TextEditingController();
  final TextEditingController controllerSGK = TextEditingController();

  final TextEditingController controllerBranchName = TextEditingController();
  final TextEditingController controllerTheParentUnitToWhichItIsConnected =
      TextEditingController();
  final TextEditingController controllerVacationDays = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        cardSirket(),
        SizedBox(height: 20),
        cardSube(),
        SizedBox(height: 20),
        cardDepartmant(),
        SizedBox(height: 20),
        cardUnvan(),
      ],
    );
  }

  Visibility cardUnvan() {
    return Visibility(
      visible: widget.unvan,
      child: Padding(
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
                        setState(() {});
                      },
                      child: Text("Yeni Ekle"),
                    )
                  ],
                ),
              ),
              Column(
                children: const [
                  Text("Yazılacak burası", style: kLabelThinStyle),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Visibility cardDepartmant() {
    return Visibility(
      visible: widget.departman,
      child: Padding(
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
                        setState(() {});
                      },
                      child: Text("Yeni Ekle"),
                    )
                  ],
                ),
              ),
              Column(
                children: const [
                  Text("Yazılacak burası", style: kLabelThinStyle),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Visibility cardSube() {
    return Visibility(
      visible: widget.sube,
      child: Padding(
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
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (_) => AddNewBranch(
                            controllerBranchName: controllerBranchName,
                            controllerTheParentUnitToWhichItIsConnected:
                                controllerTheParentUnitToWhichItIsConnected,
                            controllerVacationDays: controllerVacationDays,
                          ),
                        );
                        //Navigator.pop(context);
                      },
                      child: Text("Yeni Ekle"),
                    )
                  ],
                ),
              ),
              Column(
                children: const [
                  Text("Yazılacak burası", style: kLabelThinStyle),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding cardSirket() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 250),
      child: InkWell(
        onTap: () {
          setState(() {
            widget.sirket = true;
          });
        },
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
                      onPressed: () async {
                        await showDialog(
                            context: context,
                            builder: (_) => AddNewCompany(
                                  controllerCompanyName: controllerCompanyName,
                                  controllerTelephone: controllerTelephone,
                                  controllerMail: controllerMail,
                                  controllerMersisNumber:
                                      controllerMersisNumber,
                                  controllerSGK: controllerSGK,
                                ));
                        //Navigator.pop(context);
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
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: sirketAdi.length + 1,
                      itemBuilder: (BuildContext ctx, index) {
                        return InkWell(
                          onTap: index == 0
                              ? null
                              : () {
                                  setState(() {
                                    widget.sube = true;
                                  });
                                },
                          child: SizedBox(
                            height: 61,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Center(
                                      child: Text(index == 0
                                          ? "Şirket Adı"
                                          : sirketAdi[index - 1])),
                                ),
                                const VerticalDivider(thickness: 3),
                                Expanded(
                                  child: Center(
                                      child: Text(index == 0
                                          ? "Çalışan Sayısı"
                                          : calisanSayisi[index - 1])),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

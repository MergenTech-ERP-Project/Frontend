import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_dropdownitems.dart';
import 'package:vtys_kalite/componenets/custom_radiolisttile.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/models/departments_enum.dart';
import 'package:vtys_kalite/utilities/constants.dart';

class DailyInspectionFormPage extends StatefulWidget {
  static String routeName = '/DailyInspectionFormPage';

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController departmantController = TextEditingController();
  final TextEditingController outofHoursActivityDescriptionController =
      TextEditingController();

  DailyInspectionFormPage({Key? key}) : super(key: key);

  @override
  _DailyInspectionFormPageState createState() =>
      _DailyInspectionFormPageState();
}

class _DailyInspectionFormPageState extends State<DailyInspectionFormPage> {
  List<String> outofHoursWorkPlace = [
    "ŞİRKET İÇİ",
    "ŞİRKET DIŞI",
  ];
  int? selectedOutofHoursWorkPlace = 0;

  List<String> titlesDepartmant = [];

  @override
  Widget build(BuildContext context) {

    for (var departmant in DepartmentsEnum.values) {
      titlesDepartmant.add(EnumToString.convertToString(departmant));
    }

    var screenSize = MediaQuery.of(context).size;
    return Center(
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width / 4,
          vertical: 50,
        ),
        children: [
          const SizedBox(height: 20),
          CustomTextBox(
            borderless: true,
            title: "Username",
            controller: widget.usernameController,
            customFontSize: 20,
          ),
          SizedBox(height: 10),
          MultipleChoiceCustomDropDownItems(
            list: titlesDepartmant,
            isExpandedYes: true,
            text: 'Select Departmant',
            iconSize: 20,
            icon: Icon(Icons.arrow_drop_down),
            onChanged: (val){},
          ),
          SizedBox(height: 10),
          CustomTextBox(title: "Mesai Dışı Çalışma Tarihi"),
          SizedBox(height: 10),
          Text("MESAİ DIŞI ÇALIŞMA YERİ", style: kLabelStyle),
          SizedBox(height: 10),
          MultipleChoiceRadioListTile(
            list: outofHoursWorkPlace,
            groupValue: selectedOutofHoursWorkPlace,
          ),
          SizedBox(height: 10),
          buildDescriptionTextFormField(),
          SizedBox(height: 10),
          CustomTextBox(title: "Çalışma Başlangıç Saati"),
          SizedBox(height: 10),
          CustomTextBox(title: "Çalışma Bitiş Saati"),
          SizedBox(height: 10),
          CustomTextBox(
            borderless: true,
            title: "Toplam Çalışma Süresi",
            controller: widget.departmantController,
            customFontSize: 20,
          ),
          const SizedBox(height: 30),
          CustomButton(
            title: "Kaydet",
            pressAction: () {},
          ),
        ],
      ),
    );
  }

  Column buildDescriptionTextFormField() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Mesai Dışı Faaliyet / Açıklama", style: kLabelStyle),
        SizedBox(height: 10),
        Container(
          height: 50,
          child: TextFormField(
            controller: widget.outofHoursActivityDescriptionController,
            textAlign: TextAlign.start,
            maxLines: null,
            minLines: null,
            expands: true,
          ),
        ),
      ],
    );
  }
}

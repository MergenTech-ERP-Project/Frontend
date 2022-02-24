// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_radiolisttile.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/componenets/custom_text_divider.dart';
import 'package:vtys_kalite/screens/Forms/components/text_widget.dart';
import 'package:vtys_kalite/utilities/controllers.dart';
import 'package:vtys_kalite/utilities/style.dart';

class TravelAssignmentNotificationFormPage extends StatefulWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController destinationCityController =
      TextEditingController();
  DateTime travelStartDateController = DateTime.now();

  final TextEditingController outbondTransportController =
      TextEditingController();
  final TextEditingController companyInstitutionFormController =
      TextEditingController();
  final TextEditingController companyVehiclePlakeController =
      TextEditingController();

  DateTime probableReturnDate = DateTime.now();

  final TextEditingController aboutDayControllers = TextEditingController();
  final TextEditingController travelReturnDateController =
      TextEditingController();
  final TextEditingController returnTransportVehicleController =
      TextEditingController();
  final TextEditingController spentDayController = TextEditingController();

  DateTime date = DateTime.now();
  final TextEditingController tutarTLController = TextEditingController();

  DateTime date2 = DateTime.now();
  final TextEditingController tutarTLController2 = TextEditingController();

  TravelAssignmentNotificationFormPage({Key? key}) : super(key: key);

  @override
  _TravelAssignmentNotificationFormPageState createState() =>
      _TravelAssignmentNotificationFormPageState();
}

class _TravelAssignmentNotificationFormPageState
    extends State<TravelAssignmentNotificationFormPage> {
  List<String> reasonOfGoing = ["Kurulum", "Eğitim", "Bakım-Destek", "Hiçbiri"];
  int? selectedReasonOfGoing = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            height: 100,
            color: activeColor.withOpacity(.4),
            child: Center(
              child: CustomText(
                  color: whiteColor,
                  text: "Seyahat Görevlendirme / Bildirim Formu",
                  size: 40,
                  textAlign: TextAlign.center),
            ),
          ),
          const SizedBox(height: 30),
          textWidget(
            label: "Username",
            textEditingController: widget.usernameController,
          ),
          CustomTextDivider(
            height: 40,
            thickness: 2,
            text: "Seyahat Gidiş Bilgileri",
          ),
          textWidget(
            label: "Gidilen Şehir",
            textEditingController: widget.destinationCityController,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: CustomDateTimePicker(
                  suffixWidget: const Icon(Icons.calendar_today_outlined),
                  labelText: "Seyahat Başlangıç Tarihi",
                  borderless: true,
                  onChanged: (val) {
                    if (val != null) {
                      print("DateTime picker : " + val);
                    }
                    try {
                      widget.travelStartDateController =
                          dateTimeFormat.parse(val!);
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                ),
              ),
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 4,
                child: textWidget(
                  label: "Gidiş Ulaşım Aracı",
                  textEditingController: widget.outbondTransportController,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          textWidget(
            label: "Gidilen Firma / Kurum Adı",
            textEditingController: widget.companyInstitutionFormController,
          ),
          textWidget(
            label: "Şirket Aracı Alınacak İse Aracın Plakası",
            textEditingController: widget.companyVehiclePlakeController,
          ),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: CustomDateTimePicker(
                  suffixWidget: const Icon(Icons.calendar_today_outlined),
                  labelText: "Muhtemel Seyahat Dönüş Tarihi",
                  borderless: true,
                  onChanged: (val) {
                    if (val != null) {
                      print("DateTime picker : " + val);
                    }
                    try {
                      widget.probableReturnDate = dateTimeFormat.parse(val!);
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                ),
              ),
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 4,
                child: textWidget(
                  label: "Yaklaşık (Gün Olarak)",
                  textEditingController: widget.aboutDayControllers,
                ),
              ),
            ],
          ),
          CustomTextDivider(
            height: 40,
            thickness: 2,
            text: "Gidiş Nedeni",
          ),
          MultipleChoiceRadioListTile(
            list: reasonOfGoing,
            groupValue: selectedReasonOfGoing,
          ),
          const CustomText(text: "Alınan Avanslar"),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: CustomDateTimePicker(
                  suffixWidget: const Icon(Icons.calendar_today_outlined),
                  labelText: "Tarih",
                  borderless: true,
                  onChanged: (val) {
                    if (val != null) {
                      print("DateTime picker : " + val);
                    }
                    try {
                      widget.date = dateTimeFormat.parse(val!);
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                ),
              ),
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 4,
                child: textWidget(
                  label: "Tutar ( TL )",
                  textEditingController: widget.tutarTLController,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: CustomDateTimePicker(
                  suffixWidget: const Icon(Icons.calendar_today_outlined),
                  labelText: "Tarih",
                  borderless: true,
                  onChanged: (val) {
                    if (val != null) {
                      print("DateTime picker : " + val);
                    }
                    try {
                      widget.date2 = dateTimeFormat.parse(val!);
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                ),
              ),
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 4,
                child: textWidget(
                  label: "Tutar ( TL )",
                  textEditingController: widget.tutarTLController2,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CustomText(text: "A-AVANS TOPLAMI "),
              CustomText(text: "27091998 TL"),
            ],
          ),
          const SizedBox(height: 20),
          const CustomText(text: "Seyahat Dönüş Bilgileri"),
          CustomTextDivider(
            height: 40,
            thickness: 2,
            text: "Seyahat Dönüş Bilgileri",
          ),
          textWidget(
            label: "Seyahat Dönüş Tarihi",
            textEditingController: widget.travelReturnDateController,
          ),
          textWidget(
            label: "Dönüş Ulacım Aracı",
            textEditingController: widget.returnTransportVehicleController,
          ),
          textWidget(
            label: "Kalış Süresi (gün)",
            textEditingController: widget.spentDayController,
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
}

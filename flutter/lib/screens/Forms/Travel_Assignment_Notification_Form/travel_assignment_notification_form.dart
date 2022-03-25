// ignore_for_file: avoid_print, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_radiolisttile.dart';
import 'package:vtys_kalite/componenets/custom_text.dart';
import 'package:vtys_kalite/componenets/custom_text_divider.dart';
import 'package:vtys_kalite/helpers/responsiveness.dart';
import 'package:vtys_kalite/screens/Forms/components/text_widget.dart';
import 'package:vtys_kalite/screens/Forms/forms.dart';
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
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            height: ResponsiveWidget.isSmallScreen(context) ? 300 : 150,
            color: activeColor.withOpacity(.4),
            child: Center(
              child: CustomText(
                  color: whiteColor,
                  text: "Seyahat Görevlendirme \n Bildirim Formu",
                  size: 30,
                  textAlign: TextAlign.center),
            ),
          ),
          const SizedBox(height: 30),
          TextWidget(
            label: "Kullanıcı Adı",
            textEditingController: widget.usernameController,
          ),
          const CustomTextDivider(
            height: 40,
            thickness: 2,
            text: "Seyahat Gidiş Bilgileri",
          ),
          TextWidget(
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
                child: TextWidget(
                  label: "Gidiş Ulaşım Aracı",
                  textEditingController: widget.outbondTransportController,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          TextWidget(
            label: "Gidilen Firma / Kurum Adı",
            textEditingController: widget.companyInstitutionFormController,
          ),
          TextWidget(
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
                child: TextWidget(
                  label: "Yaklaşık (Gün Olarak)",
                  textEditingController: widget.aboutDayControllers,
                ),
              ),
            ],
          ),
          const CustomTextDivider(
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
          CustomDateTimePicker(
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
          TextWidget(
            label: "Tutar ( TL )",
            textEditingController: widget.tutarTLController,
          ),
          CustomDateTimePicker(
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
          TextWidget(
            label: "Tutar ( TL )",
            textEditingController: widget.tutarTLController2,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CustomText(text: "A-AVANS TOPLAMI "),
                CustomText(text: "27091998 TL"),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const CustomTextDivider(
            height: 40,
            thickness: 2,
            text: "Seyahat Dönüş Bilgileri",
          ),
          TextWidget(
            label: "Seyahat Dönüş Tarihi",
            textEditingController: widget.travelReturnDateController,
          ),
          TextWidget(
            label: "Dönüş Ulacım Aracı",
            textEditingController: widget.returnTransportVehicleController,
          ),
          TextWidget(
            label: "Kalış Süresi (gün)",
            textEditingController: widget.spentDayController,
          ),
          const SizedBox(height: 30),
          CustomButton(
            title: "Kaydet",
            pressAction: () {
              setState(() {
                Get.back();
                travelAssignmentNotificationFormInfo.formsPageOnTap = true;
              });
            },
          ),
        ],
      ),
    );
  }
}

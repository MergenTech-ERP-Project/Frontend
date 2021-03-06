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
  List<String> reasonOfGoing = ["Kurulum", "E??itim", "Bak??m-Destek", "Hi??biri"];
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
                  text: "Seyahat G??revlendirme \n Bildirim Formu",
                  size: 30,
                  textAlign: TextAlign.center),
            ),
          ),
          const SizedBox(height: 30),
          TextWidget(
            label: "Kullan??c?? Ad??",
            textEditingController: widget.usernameController,
          ),
          const CustomTextDivider(
            height: 40,
            thickness: 2,
            text: "Seyahat Gidi?? Bilgileri",
          ),
          TextWidget(
            label: "Gidilen ??ehir",
            textEditingController: widget.destinationCityController,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: CustomDateTimePicker(
                  suffixWidget: const Icon(Icons.calendar_today_outlined),
                  labelText: "Seyahat Ba??lang???? Tarihi",
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
                  label: "Gidi?? Ula????m Arac??",
                  textEditingController: widget.outbondTransportController,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          TextWidget(
            label: "Gidilen Firma / Kurum Ad??",
            textEditingController: widget.companyInstitutionFormController,
          ),
          TextWidget(
            label: "??irket Arac?? Al??nacak ??se Arac??n Plakas??",
            textEditingController: widget.companyVehiclePlakeController,
          ),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: CustomDateTimePicker(
                  suffixWidget: const Icon(Icons.calendar_today_outlined),
                  labelText: "Muhtemel Seyahat D??n???? Tarihi",
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
                  label: "Yakla????k (G??n Olarak)",
                  textEditingController: widget.aboutDayControllers,
                ),
              ),
            ],
          ),
          const CustomTextDivider(
            height: 40,
            thickness: 2,
            text: "Gidi?? Nedeni",
          ),
          MultipleChoiceRadioListTile(
            list: reasonOfGoing,
            groupValue: selectedReasonOfGoing,
          ),
          const CustomText(text: "Al??nan Avanslar"),
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
            text: "Seyahat D??n???? Bilgileri",
          ),
          TextWidget(
            label: "Seyahat D??n???? Tarihi",
            textEditingController: widget.travelReturnDateController,
          ),
          TextWidget(
            label: "D??n???? Ulac??m Arac??",
            textEditingController: widget.returnTransportVehicleController,
          ),
          TextWidget(
            label: "Kal???? S??resi (g??n)",
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

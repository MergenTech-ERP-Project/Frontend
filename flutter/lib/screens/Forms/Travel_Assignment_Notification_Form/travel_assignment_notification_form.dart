import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_radiolisttile.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class TravelAssignmentNotificationFormPage extends StatefulWidget {
  static String routeName = '/TravelAssignmentNotificationFormPage';

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController destinationCityController = TextEditingController();
  final TextEditingController travelStartDateController = TextEditingController();
  final TextEditingController outbondTransportController = TextEditingController();
  final TextEditingController companyInstitutionFormController = TextEditingController();
  final TextEditingController companyVehiclePlakeController = TextEditingController();
  final TextEditingController ApproximatelytravelReturnDateController = TextEditingController();
  final TextEditingController AboutReturnDayController = TextEditingController();
  final TextEditingController FirstDateController = TextEditingController();
  final TextEditingController FirstAmountController = TextEditingController();
  final TextEditingController SecondDateController = TextEditingController();
  final TextEditingController SecondAmountController = TextEditingController();
  final TextEditingController travelReturnDateController = TextEditingController();
  final TextEditingController returnTransportVehicleController = TextEditingController();
  final TextEditingController spentDayController = TextEditingController();

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
        padding: EdgeInsets.symmetric(
            horizontal: screenSize.width / 4, vertical: 50),
        children: [
          const SizedBox(height: 20),
          CustomTextBox(
            borderless: true,
            title: "Username",
            controller: widget.usernameController,
            customFontSize: 20,
          ),
          const SizedBox(height: 20),
          const Text("Seyahat Gidiş Bilgileri",
              style: kLabelHeaderStyle, textAlign: TextAlign.center),
          const SizedBox(height: 20),
          Column(
            children: [
              CustomTextBox(
                borderless: true,
                title: "Gidilen Şehir",
                controller: widget.destinationCityController,
                customFontSize: 20,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Flexible(
                    child: CustomTextBox(
                      borderless: false,
                      title: "Seyahat Başlangıç Tarihi",
                      controller: widget.travelStartDateController,
                      customFontSize: 20,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    child: CustomTextBox(
                      borderless: true,
                      title: "Gidiş Ulaşım Aracı",
                      controller: widget.outbondTransportController,
                      customFontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              CustomTextBox(
                borderless: true,
                title: "Gidilen Firma / Kurum Adı",
                controller: widget.companyInstitutionFormController,
                customFontSize: 20,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Flexible(
                    child: CustomTextBox(
                      borderless: false,
                      title: "Şirket Aracı Alınacak İse Aracın Plakası",
                      controller: widget.companyVehiclePlakeController,
                      customFontSize: 20,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    child: CustomTextBox(
                      borderless: true,
                      title: "Muhtemel Seyahat Dönüş Tarihi",
                      controller: widget.ApproximatelytravelReturnDateController,
                      customFontSize: 20,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    child: CustomTextBox(
                      borderless: true,
                      title: "Yaklaşık (Gün Olarak)",
                      controller: widget.AboutReturnDayController,
                      customFontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Text("Gidiş Nedeni",
              style: kLabelStyle, textAlign: TextAlign.center),
          MultipleChoiceRadioListTile(
            list: reasonOfGoing,
            groupValue: selectedReasonOfGoing,
          ),
          //Eğer hiçbiri olursa bir customBox açılmasını istiyorum.!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          const Text("Alınan Avanslar",
              style: kLabelStyle, textAlign: TextAlign.center),
          Row(
            children: [
              Flexible(
                child: CustomTextBox(
                  borderless: false,
                  title: "Tarih",
                  controller: widget.FirstDateController,
                  customFontSize: 20,
                ),
              ),
              const SizedBox(width: 20),
              Flexible(
                child: CustomTextBox(
                  borderless: true,
                  title: "Tutar ( TL )",
                  controller: widget.FirstAmountController,
                  customFontSize: 20,
                ),
              ),
              const SizedBox(width: 20),
              Flexible(
                child: CustomTextBox(
                  borderless: false,
                  title: "Tarih",
                  controller: widget.SecondDateController,
                  customFontSize: 20,
                ),
              ),
              const SizedBox(width: 20),
              Flexible(
                child: CustomTextBox(
                  borderless: true,
                  title: "Tutar",
                  controller: widget.SecondAmountController,
                  customFontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text("A-AVANS TOPLAMI ", style: kLabelStyle),
              Text("27091998 TL", style: kLabelThinStyle),
            ],
          ),
          const SizedBox(height: 20),
          const Text("Seyahat Dönüş Bilgileri",
              style: kLabelHeaderStyle, textAlign: TextAlign.center),
          const SizedBox(height: 20),
          Row(
            children: [
              Flexible(
                child: CustomTextBox(
                  borderless: false,
                  title: "Seyahat Dönüş Tarihi",
                  controller: widget.travelReturnDateController,
                  customFontSize: 20,
                ),
              ),
              const SizedBox(width: 20),
              Flexible(
                child: CustomTextBox(
                  borderless: true,
                  title: "Dönüş Ulacım Aracı",
                  controller: widget.returnTransportVehicleController,
                  customFontSize: 20,
                ),
              ),
              const SizedBox(width: 20),
              Flexible(
                child: CustomTextBox(
                  borderless: true,
                  title: "Kalış Süresi (gün)",
                  controller: widget.spentDayController,
                  customFontSize: 20,
                ),
              ),
            ],
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

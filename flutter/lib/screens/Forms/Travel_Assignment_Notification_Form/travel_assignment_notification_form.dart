import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_radiolisttile.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/utilities/constans.dart';

class TravelAssignmentNotificationFormPage extends StatefulWidget {
  static String routeName = '/TravelAssignmentNotificationFormPage';

  final TextEditingController usernameController = TextEditingController();

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
    return Scaffold(
      appBar:
          AppBar(title: const Text("Seyahat Görevlendirme / Bildirim Formu")),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenSize.width / 4, vertical: 50),
        child: ListView(
          children: [
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
                  controller: widget.usernameController,
                  customFontSize: 20,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      child: CustomTextBox(
                        borderless: false,
                        title: "Seyahat Başlangıç Tarihi",
                        controller: widget.usernameController,
                        customFontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      child: CustomTextBox(
                        borderless: true,
                        title: "Gidiş Ulaşım Aracı",
                        controller: widget.usernameController,
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
                  controller: widget.usernameController,
                  customFontSize: 20,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      child: CustomTextBox(
                        borderless: false,
                        title: "Şirket Aracı Alınacak İse Aracın Plakası",
                        controller: widget.usernameController,
                        customFontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      child: CustomTextBox(
                        borderless: true,
                        title: "Muhtemel Seyahat Dönüş Tarihi",
                        controller: widget.usernameController,
                        customFontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      child: CustomTextBox(
                        borderless: true,
                        title: "Yaklaşık (Gün Olarak)",
                        controller: widget.usernameController,
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
            //Eğer hiçbiri olursa bir customBox açılmasını istiyorum.
            const Text("Alınan Avanslar",
                style: kLabelStyle, textAlign: TextAlign.center),
            Row(
              children: [
                Flexible(
                  child: CustomTextBox(
                    borderless: false,
                    title: "Tarih",
                    controller: widget.usernameController,
                    customFontSize: 20,
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: CustomTextBox(
                    borderless: true,
                    title: "Tutar ( TL )",
                    controller: widget.usernameController,
                    customFontSize: 20,
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: CustomTextBox(
                    borderless: false,
                    title: "Tarih",
                    controller: widget.usernameController,
                    customFontSize: 20,
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: CustomTextBox(
                    borderless: true,
                    title: "Tutar",
                    controller: widget.usernameController,
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
                    controller: widget.usernameController,
                    customFontSize: 20,
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: CustomTextBox(
                    borderless: true,
                    title: "Dönüş Ulacım Aracı",
                    controller: widget.usernameController,
                    customFontSize: 20,
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: CustomTextBox(
                    borderless: true,
                    title: "Kalış Süresi (gün)",
                    controller: widget.usernameController,
                    customFontSize: 20,
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

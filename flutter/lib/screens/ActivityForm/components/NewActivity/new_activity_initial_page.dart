import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/models/activity.dart';
import 'package:vtys_kalite/utilities/controllers.dart';

class NewActivityInitialPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController organizatorController = TextEditingController();
  DateTime? initialDate;

  final _newActivityInitialPageForm = GlobalKey<FormState>();

  final Function(Activity) onNextButtonClick;

  NewActivityInitialPage({
    Key? key,
    this.initialDate,
    required this.onNextButtonClick,
  }) : super(key: key) {
    initialDate ??= DateTime.now();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
          key: _newActivityInitialPageForm,
          child: Column(
            children: [
              buildTextBox(
                nameController,
                'İsim',
                Icons.person,
              ),
              buildTextBox(
                placeController,
                'Konum',
                Icons.home,
              ),
              buildTextBox(
                organizatorController,
                'Organizatör',
                Icons.person,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomDateTimePicker(
                  suffixWidget: const Icon(Icons.calendar_today_outlined),
                  borderless: true,
                  labelText: " Tarih",
                  onChanged: (val) {
                    if (val != null) {
                      try {
                        initialDate = dateTimeFormat.parse(val);
                      } catch (e) {
                        debugPrint(e.toString());
                      }
                    }
                  },
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        const SizedBox(height: 10),
        CustomButton(
          width: double.infinity,
          rightIcon: Icons.keyboard_arrow_right,
          title: "Devam Et", //next
          pressAction: () {
            if (_newActivityInitialPageForm.currentState!.validate()) {
              Activity activity = Activity(
                id: 0,
                name: nameController.text,
                place: placeController.text,
                datetime: dateTimeFormat.format(initialDate!).toString(),
                organizator: organizatorController.text,
              );
              onNextButtonClick(activity);
              activityController.postActivity(activity);
            }
          },
        ),
      ],
    );
  }

  Widget buildTextBox(
      TextEditingController controller, String label, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextBox(
        borderless: true,
        controller: controller,
        suffixWidget: Icon(iconData),
        label: label,
        validator: (val) {
          if (val!.isEmpty) {
            return "Doldurulması Gerekli";
          } else {
            return null;
          }
        },
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

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
  Activity? activity;

  final _newActivityInitialPageForm = GlobalKey<FormState>();

  final Function(Activity) onNextButtonClick;

  NewActivityInitialPage({
    Key? key,
    this.initialDate,
    required this.onNextButtonClick,
    this.activity,
  }) : super(key: key) {
    if (activity != null) {
      nameController.text = activity!.name!;
      placeController.text = activity!.place!;
      initialDate = dateTimeFormat.parse(activity!.datetime!);
      organizatorController.text = activity!.organizator!;
    } else {
      initialDate ??= DateTime.now();
    }
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
                  initialDate: initialDate,
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
          pressAction: () async {
            if (_newActivityInitialPageForm.currentState!.validate()) {
              bool isActivitExists = activity != null;
              activity = activity ?? Activity(id: 0);
              activity!.name = nameController.text;
              activity!.place = placeController.text;
              activity!.datetime =
                  dateTimeFormat.format(initialDate!).toString();
              activity!.organizator = organizatorController.text;

              onNextButtonClick(activity!);

              await (isActivitExists
                  ? activityController.putActivity(activity!)
                  : activityController.postActivity(activity!));
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

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:vtys_kalite/componenets/custom_button.dart';
import 'package:vtys_kalite/componenets/custom_datetimepicker.dart';
import 'package:vtys_kalite/componenets/custom_text_box.dart';
import 'package:vtys_kalite/screens/ActivityForm/main_form_page.dart';
import 'package:vtys_kalite/utilities/constants.dart';

import '../../new_activity_page.dart';
import 'new_activity_next_button.dart';

class NewActivityInitialPage extends StatefulWidget {
  const NewActivityInitialPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  State<NewActivityInitialPage> createState() => _NewActivityInitialPageState();
}

class _NewActivityInitialPageState extends State<NewActivityInitialPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 8,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildTextBox(NewActivityPage.nameController, 'Name'),
                buildTextBox(NewActivityPage.placeController, 'Place'),
                CustomDateTimePicker(
                  labelText: "Date",
                  onChanged: (val) {
                    if (val != null) {
                      try {
                        NewActivityPage.date = dateTimeFormat.parse(val);
                      } catch (e) {
                        debugPrint(e.toString());

                      }
                    }
                  },
                ),
                const SizedBox(height: 10),
                buildTextBox(
                    NewActivityPage.organizatorController, 'Organizer'),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: CustomButton(
                    title: "Cancel",
                    pressAction: () {
                      Navigator.pushReplacementNamed(
                          context, MainFormPage.routeName);
                    }),
              ),
              const Expanded(flex: 1, child: Text("")),
              Expanded(
                flex: 2,
                child: NewActivityNextButton(
                  controller: widget.controller,
                  isValid: validation(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  CustomTextBox buildTextBox(TextEditingController controller, String label) {
    return CustomTextBox(
      controller: controller,
      label: label,
      validator: (val) {
        if (val!.isEmpty) {
          return "Cannot Be Blank";
        } else {
          return null;
        }
      },
    );
  }

  bool validation() {
    return NewActivityPage.nameController.text.trim() == "" &&
        NewActivityPage.placeController.text.trim() == "" &&
        NewActivityPage.organizatorController.text.trim() == "";
  }
}

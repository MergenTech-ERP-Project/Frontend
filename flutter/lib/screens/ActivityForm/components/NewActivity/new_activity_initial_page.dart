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
  final newActivityKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 8,
          child: Form(
            key: newActivityKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildTextBox(NewActivityPage.nameController, 'Name', 'Name'),
                  buildTextBox(
                      NewActivityPage.placeController, 'Place', 'Place'),
                  CustomDateTimePicker(
                    text: 'Date',
                    onChanged: (val) {
                      if (val != null) {
                        print("DateTime picker : " + val);
                        try {
                          NewActivityPage.date = dateTimeFormat.parse(val);
                        } catch (e) {
                          print(e.toString());
                        }
                      }
                    },
                  ),
                  buildTextBox(NewActivityPage.organizatorController,
                      'Organizer', 'Organizer'),
                ],
              ),
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
                  newActivityKey: newActivityKey,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  CustomTextBox buildTextBox(
      TextEditingController controller, String title, String hint) {
    return CustomTextBox(
      controller: controller,
      title: title,
      hint: hint,
      validator: (val) {
        if (val!.isEmpty) {
          return "Cannot Be Blank";
        } else {
          return null;
        }
      },
    );
  }
}

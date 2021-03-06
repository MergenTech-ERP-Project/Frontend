// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:vtys_kalite/screens/Forms/components/forms_card.dart';
import 'package:vtys_kalite/screens/Forms/forms.dart';

class FormsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: formsList.length,
        itemBuilder: (context, index) {
          return FormsCard(
            index: index,
            formsInfo: formsList[index],
          );
        },
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          childAspectRatio: 1.2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}

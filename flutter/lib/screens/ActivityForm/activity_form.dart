import 'package:flutter/material.dart';

class ActivityFormPage extends StatelessWidget {
  static String routeName = '/ActivityFormPage';

  const ActivityFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Activity Form Sayfası",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}

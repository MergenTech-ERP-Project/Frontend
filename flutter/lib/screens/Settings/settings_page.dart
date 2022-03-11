import 'package:flutter/material.dart';

import 'OptionalCompanyDescriptions/optional_company_descriptions.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ///Tab
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: OptionalCompanyDescriptions(),
    );
  }
}

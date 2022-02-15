import 'package:flutter/material.dart';

import 'OptionalCompanyDescriptions/optional_company_descriptions.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return OptionalCompanyDescriptions();
  }
}

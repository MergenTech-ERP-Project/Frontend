import 'package:flutter/material.dart';

import 'OptionalCompanyDescriptions/optional_company_descriptions.dart';

class SettingsPage extends StatefulWidget {
  static String routeName = '/SettingsPage';
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          //automaticallyImplyLeading: true, //geri butonunu kaldırma
          backgroundColor: Colors.white,
          bottom: const TabBar(
            indicatorColor: Colors.white38,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Seçmeli Şirket Tanımları',
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              OptionalCompanyDescriptions(),
            ],
          )
        ),
      ),
    );
  }
}


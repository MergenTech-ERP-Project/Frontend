import 'package:flutter/material.dart';

import 'ReferencesPage/references_page.dart';

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
      length: 2,
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
              Tab(
                icon: Icon(Icons.directions_bike),
                text: 'Test 2',
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              ReferencesPage(),
              const Center(child: Text("Page 2"))
            ],
          )
        ),
      ),
    );
  }
}


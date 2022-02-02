import 'package:flutter/material.dart';
import 'package:vtys_kalite/utilities/constants.dart';

class MainFormDrawer extends StatelessWidget {
  MainFormDrawer({
    Key? key,
    required this.scaffoldKey,
    required this.controller,
  }) : super(key: key);

  final PageController controller;
  GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kTertiaryColor,
        child: ListView(
          children: [
            buildListTile(
              const Icon(Icons.event_available_sharp),
              "My Activities",
              () => ToPage(0),
            ),
            buildListTile(
              const Icon(Icons.event_available_sharp),
              "Seyahat Görevlendirme / Bildirim Formu",
              () => ToPage(1),
            ),
            buildListTile(
              const Icon(Icons.event_available_sharp),
              "İzin Talep Formu",
              () => ToPage(2),
            ),
            buildListTile(
              const Icon(Icons.event_available_sharp),
              "Mesai Dışı Faaliyet Günlük İzlem Formu",
              () => ToPage(3),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: buildListTile(
                const Icon(Icons.settings),
                "Settings",
                    () => ToPage(4),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildListTile(Icon icon, String text, onTap) {
    return ListTile(
      leading: icon,
      title: Text(text, style: kLabelAppBarThinStyle),
      onTap: onTap,
    );
  }

  void ToPage(int index) {
    controller.animateToPage(index,
        duration: const Duration(milliseconds: 400), curve: Curves.bounceInOut);
    Future.delayed(const Duration(milliseconds: 100), () {
      scaffoldKey.currentState!.openEndDrawer();
    });
  }
}

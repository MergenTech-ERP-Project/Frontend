import 'package:flutter/material.dart';
import 'package:vtys_kalite/core/statics.dart';
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
      child: Material(
        color: kTertiaryColor,
        child: ListView(
          children: [
            buildListTile(
              Icons.person,
              "Employees",
              0,
            ),
            buildListTile(
              Icons.event,
              "My Activities",
              1,
            ),
            buildListTile(
              Icons.event_available_sharp,
              "Seyahat Görevlendirme / Bildirim Formu",
              2,
            ),
            buildListTile(
              Icons.event_available_sharp,
              "İzin Talep Formu",
              3,
            ),
            buildListTile(
              Icons.event_available_sharp,
              "Mesai Dışı Faaliyet Günlük İzlem Formu",
              4,
            ),
            buildListTile(
              Icons.settings,
              "Settings",
              5,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListTile(IconData icon, String text, int index) {
    return InkWell(
      onTap: () {
        Statics.instance.drawerSelectedIndex = index;
        ToPage(index);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        height: 60,
        color: Statics.instance.drawerSelectedIndex == index
            ? kFourthColor
            : kTertiaryColor,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Icon(
                  icon,
                  size: 30,
                  color: Colors.white,
                )),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
                flex: 7,
                child: Text(
                  text,
                  style: kLabelAppBarThinStyle,
                )),
          ],
        ),
      ),
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

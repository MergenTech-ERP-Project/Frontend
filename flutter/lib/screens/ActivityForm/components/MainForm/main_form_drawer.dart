import 'package:flutter/material.dart';
import 'package:vtys_kalite/utilities/constans.dart';

class MainFormDrawer extends StatelessWidget {
  const MainFormDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          buildListTile(
            const Icon(Icons.event_available_sharp),
            "My Activities",
          ),
          buildListTile(
            const Icon(Icons.event_available_sharp),
            "Seyahat Görevlendirme / Bildirim Formu",
          ),
          buildListTile(
            const Icon(Icons.event_available_sharp),
            "İzin Talep Formu",
          ),
          buildListTile(
            const Icon(Icons.event_available_sharp),
            "Mesai Dışı Faaliyet Günlük İzlem Formu",
          ),
        ],
      ),
    );
  }
  ListTile buildListTile(Icon icon, String text) {
    return ListTile(
      leading: icon,
      title: Text(
        text,
        style: kLabelThinStyle,
      ),
      onTap: () {},
    );
  }
}
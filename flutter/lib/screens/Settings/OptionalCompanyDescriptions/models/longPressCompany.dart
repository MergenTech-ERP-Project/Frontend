import 'package:flutter/material.dart';

class MenuItemCompany {
  final String text;
  final IconData icon;

  const MenuItemCompany({
    required this.text,
    required this.icon,
  });
}

///https://www.youtube.com/watch?v=JggTBrvVrk8&ab_channel=JohannesMilke

class MenuItemsCompany {
  static const List<MenuItemCompany> itemsFirst = [
    itemUpdate,
    itemDelete
  ];

  static const itemUpdate = MenuItemCompany(
    text: 'Güncelle',
    icon: Icons.update,
  );

  static const itemDelete = MenuItemCompany(
    text: 'Sil',
    icon: Icons.delete,
  );
}

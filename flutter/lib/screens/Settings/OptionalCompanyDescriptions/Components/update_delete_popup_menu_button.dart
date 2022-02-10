import 'package:flutter/material.dart';
import 'package:vtys_kalite/screens/Settings/OptionalCompanyDescriptions/models/long_press_company.dart';

class UpdateDeletePopupMenuButton extends StatefulWidget {
  const UpdateDeletePopupMenuButton({Key? key}) : super(key: key);

  @override
  _UpdateDeletePopupMenuButtonState createState() =>
      _UpdateDeletePopupMenuButtonState();
}

class _UpdateDeletePopupMenuButtonState
    extends State<UpdateDeletePopupMenuButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuItemCompany>(
        onSelected: (item) => setState(() {
              switch (item) {
                case MenuItemsCompany.itemUpdate:
                  print("update");
                  break;
                case MenuItemsCompany.itemDelete:
                  print("delete");
                  break;
              }
            }),
        itemBuilder: (context) => [
              ...MenuItemsCompany.itemsFirst
                  .map((MenuItemCompany item) => PopupMenuItem(
                        value: item,
                        child: Row(
                          children: [
                            Icon(item.icon, color: Colors.black, size: 20),
                            const SizedBox(height: 12),
                            Text(item.text),
                          ],
                        ),
                      ))
                  .toList(),
            ]);
  }
}

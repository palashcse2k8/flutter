
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/navigationprovider.dart';

PopupMenuButton getPopUpMenu(BuildContext context){
  final provider = Provider.of<DrawerNavigationProvider>(context, listen: false);
  return PopupMenuButton(itemBuilder: (context) {
    return [
      buildPopUpItem (
        context,
        text: 'Bangla',
        val: 0,
      ),
      buildPopUpItem (
        context,
        text: 'English',
        val: 1,
      )];
  }, onSelected: (value) {

    provider.sePopUpMenutNavigationItem(value);
    if (value == 0) {
      print("My account menu is selected.");
    } else if (value == 1) {
      print("Settings menu is selected.");
    } else if (value == 2) {
      print("Logout menu is selected.");
    }
  });
}

PopupMenuEntry buildPopUpItem (
    BuildContext context, {
      required String text, required int val
    }) {
  final provider = Provider.of<DrawerNavigationProvider>(context, listen: false);
  final selectedIndex = provider.popUpMenuSelectedIndex;

  return PopupMenuItem(
      value: val,
      child: ListTile(
        title: Text(text),
        trailing: Radio(
          value: val,
          groupValue: selectedIndex,
          onChanged: null,
        ),
      ));

}
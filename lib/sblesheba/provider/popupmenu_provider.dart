
import 'package:flutter/cupertino.dart';

enum DrawerPopUpMenuItem {
  bangla,
  english
}

class DrawerPopUpMenuProvider extends ChangeNotifier {
  DrawerPopUpMenuItem _selectedIndex = DrawerPopUpMenuItem.bangla;

  DrawerPopUpMenuItem get navigationItem => _selectedIndex;

  void setNavigationItem(DrawerPopUpMenuItem navigationItem) {
    _selectedIndex = navigationItem;
    notifyListeners();
  }
}
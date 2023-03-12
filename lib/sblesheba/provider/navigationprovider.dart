
import 'package:flutter/material.dart';
import '../datamodel/navigation_item.dart';

class DrawerNavigationProvider extends ChangeNotifier {
  DrawerNavigationItem _navigationItem = DrawerNavigationItem.home;
  int _popUpMenuSelectedIndex = 1;

  DrawerNavigationItem get navigationItem => _navigationItem;
  int get popUpMenuSelectedIndex => _popUpMenuSelectedIndex;

  void setNavigationItem(DrawerNavigationItem navigationItem) {
    _navigationItem = navigationItem;

    notifyListeners();
  }

  void sePopUpMenutNavigationItem(int selectedIndex) {
    _popUpMenuSelectedIndex = selectedIndex;

    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import '../datamodel/navigation_item.dart';

class DrawerNavigationProvider extends ChangeNotifier {
  DrawerNavigationItem _navigationItem = DrawerNavigationItem.home;

  DrawerNavigationItem get navigationItem => _navigationItem;

  void setNavigationItem(DrawerNavigationItem navigationItem) {
    _navigationItem = navigationItem;

    notifyListeners();
  }
}
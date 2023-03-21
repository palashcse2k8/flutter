
import 'package:flutter/material.dart';
import '../datamodel/PDFFileSelector.dart';
import '../datamodel/navigation_item.dart';

class DrawerNavigationProvider extends ChangeNotifier {
  DrawerNavigationItem _navigationItem = DrawerNavigationItem.home;
  int _popUpMenuSelectedIndex = 1;

  String _pdfPath = PDF.buetFeeManual;

  DrawerNavigationItem get navigationItem => _navigationItem;
  int get popUpMenuSelectedIndex => _popUpMenuSelectedIndex;
  String get pdfPath => _pdfPath;

  void setNavigationItem(DrawerNavigationItem navigationItem) {
    _navigationItem = navigationItem;

    notifyListeners();
  }

  void sePdfPath(String path) {
    _pdfPath = path;
    // notifyListeners();
  }


  void sePopUpMenuNavigationItem(int selectedIndex) {
    _popUpMenuSelectedIndex = selectedIndex;

    notifyListeners();
  }
}
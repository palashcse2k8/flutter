import 'package:flutter/material.dart';

class DashBoardCategoriesModel {
  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  DashBoardCategoriesModel({
    required this.title,
    required this.heading,
    required this.subHeading,
    required this.onPress,
  });

  static List<DashBoardCategoriesModel> categoriesList = [
    DashBoardCategoriesModel(title: "JS", heading: "Java Script", subHeading: "10 Lessons", onPress: null),
    DashBoardCategoriesModel(title: "F", heading: "Flutter", subHeading: "11 Lessons", onPress: null),
    DashBoardCategoriesModel(title: "H", heading: "Html", subHeading: "8 Lessons", onPress: null),
    DashBoardCategoriesModel(title: "P", heading: "Python", subHeading: "100 Lessons", onPress: null),
  ];
}

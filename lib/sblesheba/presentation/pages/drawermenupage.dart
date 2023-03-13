import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../datamodel/navigation_item.dart';
import '../../provider/navigationprovider.dart';
import '../../utilities/constants.dart';

Drawer getDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        getDrawerHeader(),
        buildMenuItem(
          context,
          item: DrawerNavigationItem.home,
          text: 'Home',
          icon: Icons.home,
        ),
        buildMenuItem(
          context,
          item: DrawerNavigationItem.userManual,
          text: 'User Manual',
          icon: Icons.book,
        ),
      ],
    ),
  );
}

Widget getDrawerHeader() {
  return Container(
    color: Colors.amber,
    height: 200,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            Constants.sonaliBankBanner,
            height: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Sonali eSheba",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white),
          ),
          const Text(
            "1.5.0",
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    ),
  );
}

Widget buildMenuItem(
  BuildContext context, {
  required DrawerNavigationItem item,
  required String text,
  required IconData icon,
}) {
  final provider = Provider.of<DrawerNavigationProvider>(context);
  final currentItem = provider.navigationItem;
  final isSelected = item == currentItem;

  final color = isSelected ? Colors.blue : Colors.black54;

  return Material(
    color: Colors.transparent,
    child: ListTile(
      selected: isSelected,
      selectedTileColor: Colors.blueGrey,
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color, fontSize: 16)),
      onTap: () => selectItem(context, item),
    ),
  );
}

void selectItem(BuildContext context, DrawerNavigationItem item) {
  final provider =
      Provider.of<DrawerNavigationProvider>(context, listen: false);
  provider.setNavigationItem(item);
}

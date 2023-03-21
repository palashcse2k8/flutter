import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../datamodel/navigation_item.dart';
import '../../../provider/navigationprovider.dart';
import '../../../utilities/constants.dart';

Drawer getDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        getDrawerHeader(),
        const BuildMenuItem(item: DrawerNavigationItem.home,
          text: 'Home',
          icon: Icons.home,),

        const BuildMenuItem(
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
    color: Colors.orange,
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

class BuildMenuItem extends StatefulWidget {
  final DrawerNavigationItem item;
  final String text;
  final IconData icon;

  const BuildMenuItem({super.key,
    required this.item,
    required this.text,
    required this.icon,
  });

  @override
  State<BuildMenuItem> createState() => _BuildMenuItemState();
}

class _BuildMenuItemState extends State<BuildMenuItem> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DrawerNavigationProvider>(context);
    final currentItem = provider.navigationItem;
    final isSelected = widget.item == currentItem;

    final color = isSelected ? Colors.blue : Colors.black54;

    return Material(
      color: Colors.transparent,
      child: ListTile(
        selected: isSelected,
        selectedTileColor: Colors.black26,
        leading: Icon(widget.icon, color: color),
        title: Text(widget.text, style: TextStyle(color: color, fontSize: 16)),
        onTap: () => selectItem(context, widget.item),
      ),
    );
  }
}

void selectItem(BuildContext context, DrawerNavigationItem item) {
  final provider =
      Provider.of<DrawerNavigationProvider>(context, listen: false);
  provider.setNavigationItem(item);
  Navigator.pop(context);
}

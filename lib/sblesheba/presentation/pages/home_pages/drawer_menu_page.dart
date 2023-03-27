import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../datamodel/navigation_item.dart';
import '../../../provider/navigation_provider.dart';
import '../../../utilities/constants.dart';

class CustomerDrawer extends StatelessWidget {
  const CustomerDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

class BuildMenuItem extends StatelessWidget {
  final DrawerNavigationItem item;
  final String text;
  final IconData icon;

  const BuildMenuItem({super.key,
    required this.item,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppNavigationProvider>(context);
    final currentItem = provider.navigationItem;
    final isSelected = item == currentItem;

    final color = isSelected ? Colors.blue : Colors.black54;

    return Material(
      color: Colors.transparent,
      child: ListTile(
        selected: isSelected,
        selectedTileColor: Colors.black26,
        leading: Icon(icon, color: color),
        title: Text(text, style: TextStyle(color: color, fontSize: 16)),
        onTap: () => selectItem(context, item),
      ),
    );
  }
}

void selectItem(BuildContext context, DrawerNavigationItem item) {
  final provider =
      Provider.of<AppNavigationProvider>(context, listen: false);
  provider.setNavigationItem(item);
  Navigator.pop(context);
  if (item == DrawerNavigationItem.home){
    context.go("/");
  } else {
    context.pushNamed("user-manual-page");
  }

}

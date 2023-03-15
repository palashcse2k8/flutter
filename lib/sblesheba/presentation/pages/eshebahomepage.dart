import 'package:flutter/material.dart';
import 'package:flutterbascis/sblesheba/datamodel/navigation_item.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/allservicepage.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/popupmenupage.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/user_manual_pages/user_manual_home_pages.dart';
import 'package:provider/provider.dart';

import '../../provider/navigationprovider.dart';
import 'drawermenupage.dart';

class EshebaHomePage extends StatelessWidget {
  const EshebaHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var appState = context.watch<DrawerNavigationProvider>();
    // var appState = Provider.of<DrawerNavigationProvider>(context, listen: false);
    Widget page;
    switch (appState.navigationItem) {
      case DrawerNavigationItem.home:
        page = const AllServicesPage();
        break;
      case DrawerNavigationItem.userManual:
        page = const UserManualHomePage();
        break;
      default:
        throw UnimplementedError('no widget for $DrawerNavigationItem.userManual');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sonali eSheba"),
        backgroundColor: Colors.orange,
        centerTitle: true,
        actions: [
          getPopUpMenu(context),
        ],
      ),
      drawer: getDrawer(context),
      // body: const AllServicesPage(),
      body: page,
    );
  }
}

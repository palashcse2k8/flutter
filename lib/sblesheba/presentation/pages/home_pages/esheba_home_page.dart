import 'package:flutter/material.dart';
import 'package:flutterbascis/sblesheba/datamodel/navigation_item.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/home_pages/all_services_page.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/home_pages/popup_menu_page.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/user_manual_pages/pdf_viewer_page.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/user_manual_pages/user_manual_home_pages.dart';
import 'package:provider/provider.dart';

import '../../../provider/navigation_provider.dart';
import 'drawer_menu_page.dart';

class EshebaHomePage extends StatelessWidget {
  const EshebaHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var appState = context.watch<AppNavigationProvider>();
    // var appState = Provider.of<DrawerNavigationProvider>(context, listen: false);
    Widget page;
    switch (appState.navigationItem) {
      case DrawerNavigationItem.home:
        page = const AllServicesPage();
        break;
      case DrawerNavigationItem.userManual:
        page = const UserManualHomePage();
        break;
      case DrawerNavigationItem.pdfViewer:
        page = PDFScreen(assetPath: appState.pdfPath);
        break;

      default:
        throw UnimplementedError('no widget for $DrawerNavigationItem.userManual');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sonali eSheba"),
        backgroundColor: const Color(0xffFF9A00),
        // backgroundColor: const Color.fromARGB(255,154,0,255),
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

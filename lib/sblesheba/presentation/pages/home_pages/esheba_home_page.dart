import 'package:flutter/material.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/home_pages/all_services_page.dart';

import 'custom_appbar.dart';
import 'drawer_menu_page.dart';
import 'floating_action_button.dart';

class EshebaHomePage extends StatelessWidget {
  const EshebaHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(),
        drawer: CustomerDrawer(),
        body: AllServicesPage(),
        floatingActionButton: CustomFloatingActionButton());
  }
}

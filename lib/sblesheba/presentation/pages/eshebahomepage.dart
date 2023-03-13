import 'package:flutter/material.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/allservicepage.dart';
import 'package:flutterbascis/sblesheba/presentation/pages/popupmenupage.dart';

import 'drawermenupage.dart';

class EshebaHomePage extends StatelessWidget {
  const EshebaHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sonali eSheba"),
        backgroundColor: Colors.amber,
        centerTitle: true,
        actions: [
          getPopUpMenu(context),
        ],
      ),
      drawer: getDrawer(context),
      body: const AllServicesPage(),
    );
  }
}
